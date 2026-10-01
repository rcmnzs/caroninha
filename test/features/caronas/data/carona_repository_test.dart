import 'package:caroninha_do_cesinha/core/banco/app_database.dart';
import 'package:caroninha_do_cesinha/features/caronas/data/carona_repository.dart';
import 'package:caroninha_do_cesinha/features/caronas/data/passageiro_repository.dart';
import 'package:caroninha_do_cesinha/features/caronas/domain/carona_validacao_exception.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late CaronaRepository caronas;
  late PassageiroRepository passageiros;

  setUp(() {
    database = AppDatabase.memory();
    caronas = CaronaRepository(database);
    passageiros = PassageiroRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('cria carona e passageiro com UUIDs v4', () async {
    final carona = await caronas.criar(
      passageiroNome: 'Maria de Souza',
      valorCentavos: 2500,
      data: DateTime.utc(2026, 1, 10),
    );

    final passageiro = (await passageiros.listar()).single;
    expect(carona.id, matches(RegExp(r'^[0-9a-f-]{36}$')));
    expect(passageiro.id, matches(RegExp(r'^[0-9a-f-]{36}$')));
    expect(carona.passageiroId, passageiro.id);
    expect(passageiros.listar(), completion(hasLength(1)));
    expect(carona.sincronizado, isFalse);
    expect(passageiro.sincronizado, isFalse);
  });

  test('edita e exclui carona logicamente', () async {
    final criada = await caronas.criar(
      passageiroNome: 'Ana',
      valorCentavos: 3200,
      data: DateTime.utc(2026, 3, 2),
    );

    final editada = await caronas.editar(
      criada.copyWith(valorCentavos: 4000, pago: true),
    );
    expect(editada.valorCentavos, 4000);
    expect(editada.pago, isTrue);
    expect(editada.atualizadoEm.isAfter(criada.atualizadoEm), isTrue);
    expect(editada.sincronizado, isFalse);

    await caronas.excluirLogicamente(criada.id);
    expect(await caronas.listarPorData(), isEmpty);
    expect(await (database.select(database.caronas)).get(), hasLength(1));
    expect(
      (await database.select(database.caronas).getSingle()).excluido,
      isTrue,
    );
  });

  test('lista mais recentes primeiro e aplica filtros de período, passageiro e pago', () async {
    final primeira = await caronas.criar(
      passageiroNome: 'João',
      valorCentavos: 1000,
      data: DateTime.utc(2026, 4, 1),
      pago: true,
    );
    final segunda = await caronas.criar(
      passageiroNome: 'João',
      valorCentavos: 2000,
      data: DateTime.utc(2026, 4, 3),
    );
    await caronas.criar(
      passageiroNome: 'Carla',
      valorCentavos: 3000,
      data: DateTime.utc(2026, 4, 2),
      pago: true,
    );
    final passageiroId = primeira.passageiroId;

    final lista = await caronas.listarPorData();
    expect(lista.map((item) => item.carona.data).toList(), [
      DateTime.utc(2026, 4, 3),
      DateTime.utc(2026, 4, 2),
      DateTime.utc(2026, 4, 1),
    ]);

    final filtradas = await caronas.listarPorData(
      filtro: (
        inicio: DateTime.utc(2026, 4, 1),
        fim: DateTime.utc(2026, 4, 3),
        passageiroId: passageiroId,
        pago: false,
      ),
    );
    expect(filtradas, hasLength(1));
    expect(filtradas.single.carona.id, segunda.id);
  });

  test('calcula totais recebido e pendente em centavos no período', () async {
    await caronas.criar(
      passageiroNome: 'Pedro',
      valorCentavos: 1200,
      data: DateTime.utc(2026, 5, 1),
      pago: true,
    );
    await caronas.criar(
      passageiroNome: 'Pedro',
      valorCentavos: 800,
      data: DateTime.utc(2026, 5, 2),
    );
    await caronas.criar(
      passageiroNome: 'Pedro',
      valorCentavos: 5000,
      data: DateTime.utc(2026, 6, 1),
      pago: true,
    );

    expect(
      await caronas.totalRecebido(
        DateTime.utc(2026, 5, 1),
        DateTime.utc(2026, 5, 31),
      ),
      1200,
    );
    expect(
      await caronas.totalPendente(
        DateTime.utc(2026, 5, 1),
        DateTime.utc(2026, 5, 31),
      ),
      800,
    );
  });

  test('rejeita valor nao positivo e data ausente', () async {
    await expectLater(
      caronas.criar(
        passageiroNome: 'Invalido',
        valorCentavos: 0,
        data: DateTime.utc(2026, 1, 1),
      ),
      throwsA(
        isA<CaronaValidacaoException>().having(
          (erro) => erro.campo,
          'campo',
          CampoCaronaInvalido.valorCentavos,
        ),
      ),
    );
    await expectLater(
      caronas.criar(
        passageiroNome: 'Invalido',
        valorCentavos: -1,
        data: DateTime.utc(2026, 1, 1),
      ),
      throwsA(isA<CaronaValidacaoException>()),
    );
    await expectLater(
      caronas.criar(passageiroNome: 'Invalido', valorCentavos: 1, data: null),
      throwsA(
        isA<CaronaValidacaoException>().having(
          (erro) => erro.campo,
          'campo',
          CampoCaronaInvalido.data,
        ),
      ),
    );
  });

  test('busca passageiro sem diferenciar caixa ou acentos', () async {
    await passageiros.criar(nome: 'João Coração');

    expect(await passageiros.buscarPorNome('joao coracao'), hasLength(1));
    expect(
      (await passageiros.buscarPorNome('JOÃO')).single.nome,
      'João Coração',
    );
  });

  test('excluir passageiro preserva as caronas antigas', () async {
    final carona = await caronas.criar(
      passageiroNome: 'Rita',
      valorCentavos: 1700,
      data: DateTime.utc(2026, 7, 1),
    );

    await passageiros.excluirLogicamente(carona.passageiroId);

    expect(await passageiros.listar(), isEmpty);
    final historico = await caronas.listarPorData();
    expect(historico, hasLength(1));
    expect(historico.single.carona.id, carona.id);
    expect(historico.single.passageiro.nome, 'Rita');
    expect(
      (await database.select(database.caronas).getSingle()).excluido,
      isFalse,
    );
  });

  test('edicao redefine sincronizado para false', () async {
    final criada = await caronas.criar(
      passageiroNome: 'Luiz',
      valorCentavos: 2100,
      data: DateTime.utc(2026, 8, 1),
    );
    await (database.update(database.caronas)
          ..where((tbl) => tbl.id.equals(criada.id)))
        .write(const CaronasCompanion(sincronizado: Value(true)));

    final persistida = (await caronas.listarPorData()).single.carona;
    expect(persistida.sincronizado, isTrue);

    final editada = await caronas.editar(
      persistida.copyWith(valorCentavos: 2200),
    );
    expect(editada.sincronizado, isFalse);
  });
}
