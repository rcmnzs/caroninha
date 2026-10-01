import 'package:caroninha_do_cesinha/core/banco/app_database.dart';
import 'package:caroninha_do_cesinha/core/banco/app_database.dart' as banco;
import 'package:caroninha_do_cesinha/core/banco/enums.dart';
import 'package:caroninha_do_cesinha/features/caronas/data/carona_pagamento_service.dart';
import 'package:caroninha_do_cesinha/features/caronas/data/carona_repository.dart';
import 'package:caroninha_do_cesinha/features/financeiro/data/transacao_repository.dart';
import 'package:caroninha_do_cesinha/features/financeiro/domain/transacao.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late CaronaRepository caronas;
  late TransacaoRepository transacoes;
  late CaronaPagamentoService service;

  setUp(() {
    database = AppDatabase.memory();
    caronas = CaronaRepository(database);
    transacoes = TransacaoRepository(database);
    service = CaronaPagamentoService(database, caronas, transacoes);
  });

  tearDown(() async {
    await database.close();
  });

  test('carona criada paga cria receita vinculada em centavos', () async {
    final carona = await service.criar(
      passageiroNome: 'Paula',
      valorCentavos: 4321,
      data: DateTime.utc(2026, 7, 12),
      pago: true,
    );
    final receita = await transacoes.buscarPorCaronaId(carona.id);

    expect(carona.pago, isTrue);
    expect(receita, isNotNull);
    expect(receita!.tipo, TipoTransacao.receita);
    expect(receita.categoria, CategoriaTransacao.carona);
    expect(receita.valorCentavos, 4321);
    expect(receita.data, DateTime.utc(2026, 7, 12));
    expect(receita.caronaId, carona.id);
    expect(receita.excluido, isFalse);
    expect(receita.sincronizado, isFalse);
  });

  test('transicao pendente para paga cria uma receita', () async {
    final carona = await service.criar(
      passageiroNome: 'Rui',
      valorCentavos: 2700,
      data: DateTime.utc(2026, 7, 13),
    );
    expect(await transacoes.buscarPorCaronaId(carona.id), isNull);

    final paga = await service.definirPagamento(carona.id, pago: true);
    final receita = await transacoes.buscarPorCaronaId(carona.id);
    expect(paga.pago, isTrue);
    expect(receita, isNotNull);
    expect(receita!.valorCentavos, 2700);
    expect(receita.caronaId, carona.id);
  });

  test('definir paga repetidamente e alternar nao duplica receitas', () async {
    final carona = await service.criar(
      passageiroNome: 'Lia',
      valorCentavos: 3100,
      data: DateTime.utc(2026, 7, 14),
    );

    final primeira = await service.definirPagamento(carona.id, pago: true);
    final segunda = await service.definirPagamento(carona.id, pago: true);
    final ativa = await _receitasAtivas(database, carona.id);

    expect(primeira.id, carona.id);
    expect(segunda.id, carona.id);
    expect(ativa, hasLength(1));

    await service.definirPagamento(carona.id, pago: false);
    final novamentePaga = await service.definirPagamento(carona.id, pago: true);
    final historico = await _receitasDaCarona(database, carona.id);
    expect(novamentePaga.pago, isTrue);
    expect(historico, hasLength(1));
    expect(historico.single.id, ativa.single.id);
    expect(historico.single.excluido, isFalse);
  });

  test('paga para pendente reverte receita logicamente', () async {
    final carona = await service.criar(
      passageiroNome: 'Nina',
      valorCentavos: 1900,
      data: DateTime.utc(2026, 7, 15),
      pago: true,
    );
    final receitaOriginal = (await transacoes.buscarPorCaronaId(carona.id))!;

    final pendente = await service.definirPagamento(carona.id, pago: false);
    final receita = await transacoes.buscarPorCaronaId(carona.id);

    expect(pendente.pago, isFalse);
    expect(receita!.id, receitaOriginal.id);
    expect(receita.excluido, isTrue);
    expect(receita.sincronizado, isFalse);
    expect(await _receitasAtivas(database, carona.id), isEmpty);
  });

  test(
    'editar carona paga atualiza valor data timestamps e sincronizacao',
    () async {
      final criada = await service.criar(
        passageiroNome: 'Beto',
        valorCentavos: 2000,
        data: DateTime.utc(2026, 7, 16),
        pago: true,
      );
      final receitaOriginal = (await transacoes.buscarPorCaronaId(criada.id))!;
      await (database.update(database.caronas)
            ..where((tbl) => tbl.id.equals(criada.id)))
          .write(const CaronasCompanion(sincronizado: Value(true)));
      await (database.update(database.transacoes)
            ..where((tbl) => tbl.id.equals(receitaOriginal.id)))
          .write(const TransacoesCompanion(sincronizado: Value(true)));

      final caronaPersistida = (await caronas.buscarPorId(criada.id))!.carona;
      final editada = await service.editar(
        caronaPersistida.copyWith(
          valorCentavos: 2850,
          data: DateTime.utc(2026, 7, 20),
        ),
      );
      final receitaEditada = (await transacoes.buscarPorCaronaId(criada.id))!;

      expect(editada.pago, isTrue);
      expect(editada.valorCentavos, 2850);
      expect(editada.data, DateTime.utc(2026, 7, 20));
      expect(
        editada.atualizadoEm.isAfter(caronaPersistida.atualizadoEm),
        isTrue,
      );
      expect(editada.sincronizado, isFalse);
      expect(receitaEditada.id, receitaOriginal.id);
      expect(receitaEditada.valorCentavos, 2850);
      expect(receitaEditada.data, DateTime.utc(2026, 7, 20));
      expect(
        receitaEditada.atualizadoEm.isAfter(receitaOriginal.atualizadoEm),
        isTrue,
      );
      expect(receitaEditada.sincronizado, isFalse);
      expect(await _receitasAtivas(database, criada.id), hasLength(1));
    },
  );

  test('excluir carona paga reverte receita sem apagar registros', () async {
    final carona = await service.criar(
      passageiroNome: 'Cris',
      valorCentavos: 4100,
      data: DateTime.utc(2026, 7, 17),
      pago: true,
    );
    final receitaOriginal = (await transacoes.buscarPorCaronaId(carona.id))!;

    await service.excluirLogicamente(carona.id);

    final caronaExcluida = await database.select(database.caronas).getSingle();
    final receitaExcluida = await transacoes.buscarPorCaronaId(carona.id);
    expect(caronaExcluida.excluido, isTrue);
    expect(caronaExcluida.sincronizado, isFalse);
    expect(receitaExcluida!.id, receitaOriginal.id);
    expect(receitaExcluida.excluido, isTrue);
    expect(receitaExcluida.sincronizado, isFalse);
    expect(await database.select(database.caronas).get(), hasLength(1));
    expect(await database.select(database.transacoes).get(), hasLength(1));
  });

  test(
    'falha ao criar receita desfaz carona e passageiro na mesma transacao',
    () async {
      final serviceComFalha = CaronaPagamentoService(
        database,
        caronas,
        _FalhaAoCriarReceita(database),
      );

      await expectLater(
        serviceComFalha.criar(
          passageiroNome: 'Atomicidade',
          valorCentavos: 1000,
          data: DateTime.utc(2026, 7, 18),
          pago: true,
        ),
        throwsStateError,
      );

      expect(await database.select(database.caronas).get(), isEmpty);
      expect(await database.select(database.passageiros).get(), isEmpty);
      expect(await database.select(database.transacoes).get(), isEmpty);
    },
  );

  test(
    'repository lista somente transacoes ativas dentro do periodo',
    () async {
      final caronaPaga = await service.criar(
        passageiroNome: 'Duda',
        valorCentavos: 1100,
        data: DateTime.utc(2026, 8, 1),
        pago: true,
      );
      await service.criar(
        passageiroNome: 'Duda',
        valorCentavos: 2200,
        data: DateTime.utc(2026, 9, 1),
        pago: true,
      );
      final listadasAntesDeReverter = await transacoes.listarPorPeriodo(
        DateTime.utc(2026, 8, 1),
        DateTime.utc(2026, 8, 31),
      );
      expect(listadasAntesDeReverter, hasLength(1));

      await service.definirPagamento(caronaPaga.id, pago: false);
      final listadas = await transacoes.listarPorPeriodo(
        DateTime.utc(2026, 8, 1),
        DateTime.utc(2026, 8, 31),
      );
      expect(listadas, isEmpty);
    },
  );
}

Future<List<banco.Transacoe>> _receitasAtivas(
  AppDatabase db,
  String caronaId,
) async {
  final registros = await (db.select(
    db.transacoes,
  )..where((tbl) => tbl.caronaId.equals(caronaId))).get();
  return registros.where((registro) => !registro.excluido).toList();
}

Future<List<banco.Transacoe>> _receitasDaCarona(
  AppDatabase db,
  String caronaId,
) async {
  return (await (db.select(
    db.transacoes,
  )..where((tbl) => tbl.caronaId.equals(caronaId))).get());
}

class _FalhaAoCriarReceita extends TransacaoRepository {
  // The inherited constructor parameter is private in the repository library.
  // ignore: use_super_parameters
  _FalhaAoCriarReceita(AppDatabase database) : super(database);

  @override
  Future<Transacao> criar({
    required TipoTransacao tipo,
    required CategoriaTransacao categoria,
    required int valorCentavos,
    required DateTime data,
    String? descricao,
    String? caronaId,
    String usuarioId = 'local',
  }) async {
    throw StateError('Falha simulada ao gravar a receita.');
  }
}
