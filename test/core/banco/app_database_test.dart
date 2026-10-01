import 'package:caroninha_do_cesinha/core/banco/app_database.dart';
import 'package:caroninha_do_cesinha/core/banco/enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.memory();
  });

  tearDown(() async {
    await db.close();
  });

  test('insere e lê registro de cada tabela', () async {
    final passageiroId = 'pass-1';
    await db
        .into(db.passageiros)
        .insert(
          PassageirosCompanion.insert(
            id: passageiroId,
            usuarioId: const Value('local'),
            criadoEm: Value(DateTime.utc(2024, 1, 1)),
            atualizadoEm: Value(DateTime.utc(2024, 1, 1)),
            nome: 'Maria',
            telefone: const Value('11999999999'),
          ),
        );

    final caronaId = 'car-1';
    await db
        .into(db.caronas)
        .insert(
          CaronasCompanion.insert(
            id: caronaId,
            usuarioId: const Value('local'),
            criadoEm: Value(DateTime.utc(2024, 1, 2)),
            atualizadoEm: Value(DateTime.utc(2024, 1, 2)),
            passageiroId: passageiroId,
            valorCentavos: 2500,
            data: DateTime.utc(2024, 1, 3),
            origem: const Value('Casa'),
            destino: const Value('Trabalho'),
            observacao: const Value('Teste'),
          ),
        );

    final transacaoId = 'trans-1';
    await db
        .into(db.transacoes)
        .insert(
          TransacoesCompanion.insert(
            id: transacaoId,
            usuarioId: const Value('local'),
            criadoEm: Value(DateTime.utc(2024, 1, 4)),
            atualizadoEm: Value(DateTime.utc(2024, 1, 4)),
            tipo: TipoTransacao.receita,
            categoria: CategoriaTransacao.carona,
            valorCentavos: 2500,
            data: DateTime.utc(2024, 1, 5),
            descricao: const Value('Receita da carona'),
            caronaId: Value(caronaId),
          ),
        );

    final abastecimentoId = 'abastecimento-1';
    await db
        .into(db.abastecimentos)
        .insert(
          AbastecimentosCompanion.insert(
            id: abastecimentoId,
            usuarioId: const Value('local'),
            criadoEm: Value(DateTime.utc(2024, 1, 6)),
            atualizadoEm: Value(DateTime.utc(2024, 1, 6)),
            data: DateTime.utc(2024, 1, 7),
            litros: 42.5,
            precoLitroCentavos: 650,
            valorTotalCentavos: 2762,
            kmOdometro: 12000,
            transacaoId: Value(transacaoId),
          ),
        );

    await db
        .into(db.configuracoesVeiculo)
        .insert(
          ConfiguracoesVeiculoCompanion.insert(
            id: 'config-1',
            usuarioId: const Value('local'),
            criadoEm: Value(DateTime.utc(2024, 1, 8)),
            atualizadoEm: Value(DateTime.utc(2024, 1, 8)),
            tipoCombustivel: 'gasolina',
            odometroInicial: 10000,
            metaConsumoKml: const Value(12.5),
            metaMensalCentavos: const Value(150000),
          ),
        );

    expect((await db.select(db.passageiros).get()).length, 1);
    expect((await db.select(db.caronas).get()).length, 1);
    expect((await db.select(db.transacoes).get()).length, 1);
    expect((await db.select(db.abastecimentos).get()).length, 1);
    expect((await db.select(db.configuracoesVeiculo).get()).length, 1);
  });

  test(
    'valores padrão devem ser false para excluido e sincronizado e pago',
    () async {
      final passageiroId = 'pass-2';
      await db
          .into(db.passageiros)
          .insert(
            PassageirosCompanion.insert(
              id: passageiroId,
              usuarioId: const Value('local'),
              criadoEm: Value(DateTime.utc(2024, 2, 1)),
              atualizadoEm: Value(DateTime.utc(2024, 2, 1)),
              nome: 'João',
              telefone: const Value.absent(),
            ),
          );

      final caronaId = 'car-2';
      await db
          .into(db.caronas)
          .insert(
            CaronasCompanion.insert(
              id: caronaId,
              usuarioId: const Value('local'),
              criadoEm: Value(DateTime.utc(2024, 2, 2)),
              atualizadoEm: Value(DateTime.utc(2024, 2, 2)),
              passageiroId: passageiroId,
              valorCentavos: 5000,
              data: DateTime.utc(2024, 2, 3),
              origem: const Value.absent(),
              destino: const Value.absent(),
              observacao: const Value.absent(),
            ),
          );

      final carona = (await db.select(db.caronas).getSingle());
      expect(carona.excluido, isFalse);
      expect(carona.sincronizado, isFalse);
      expect(carona.pago, isFalse);

      final passageiro = (await db.select(db.passageiros).getSingle());
      expect(passageiro.excluido, isFalse);
      expect(passageiro.sincronizado, isFalse);
    },
  );

  test('exclusao logica deve marcar excluido sem remover a linha', () async {
    final passageiroId = 'pass-3';
    final passageiro = await db
        .into(db.passageiros)
        .insertReturning(
          PassageirosCompanion.insert(
            id: passageiroId,
            usuarioId: const Value('local'),
            criadoEm: Value(DateTime.utc(2024, 3, 1)),
            atualizadoEm: Value(DateTime.utc(2024, 3, 1)),
            nome: 'Ana',
            telefone: const Value.absent(),
          ),
        );

    await (db.update(
      db.passageiros,
    )..where((tbl) => tbl.id.equals(passageiro.id))).write(
      PassageirosCompanion(
        id: Value(passageiro.id),
        usuarioId: Value('local'),
        criadoEm: Value(passageiro.criadoEm),
        atualizadoEm: Value(DateTime.utc(2024, 3, 2)),
        excluido: const Value(true),
        sincronizado: Value(passageiro.sincronizado),
        nome: Value(passageiro.nome),
        telefone: Value(passageiro.telefone),
      ),
    );

    final registros = await db.select(db.passageiros).get();
    expect(registros.length, 1);
    expect(registros.single.excluido, isTrue);
  });

  test('relacoes um para um devem rejeitar registros duplicados', () async {
    await db
        .into(db.passageiros)
        .insert(PassageirosCompanion.insert(id: 'pass-unique', nome: 'Bia'));
    await db
        .into(db.caronas)
        .insert(
          CaronasCompanion.insert(
            id: 'car-unique',
            passageiroId: 'pass-unique',
            valorCentavos: 1000,
            data: DateTime.utc(2026, 1, 1),
          ),
        );
    await db
        .into(db.transacoes)
        .insert(
          TransacoesCompanion.insert(
            id: 'trans-carona-1',
            tipo: TipoTransacao.receita,
            categoria: CategoriaTransacao.carona,
            valorCentavos: 1000,
            data: DateTime.utc(2026, 1, 1),
            caronaId: const Value('car-unique'),
          ),
        );

    await expectLater(
      db
          .into(db.transacoes)
          .insert(
            TransacoesCompanion.insert(
              id: 'trans-carona-2',
              tipo: TipoTransacao.receita,
              categoria: CategoriaTransacao.carona,
              valorCentavos: 1000,
              data: DateTime.utc(2026, 1, 1),
              caronaId: const Value('car-unique'),
            ),
          ),
      throwsA(anything),
    );

    await db
        .into(db.transacoes)
        .insert(
          TransacoesCompanion.insert(
            id: 'trans-abastecimento',
            tipo: TipoTransacao.despesa,
            categoria: CategoriaTransacao.combustivel,
            valorCentavos: 5000,
            data: DateTime.utc(2026, 1, 2),
          ),
        );
    AbastecimentosCompanion abastecimento(String id) {
      return AbastecimentosCompanion.insert(
        id: id,
        data: DateTime.utc(2026, 1, 2),
        litros: 10,
        precoLitroCentavos: 500,
        valorTotalCentavos: 5000,
        kmOdometro: 1000,
        transacaoId: const Value('trans-abastecimento'),
      );
    }

    await db.into(db.abastecimentos).insert(abastecimento('abast-1'));
    await expectLater(
      db.into(db.abastecimentos).insert(abastecimento('abast-2')),
      throwsA(anything),
    );

    await db
        .into(db.configuracoesVeiculo)
        .insert(
          ConfiguracoesVeiculoCompanion.insert(
            id: 'config-1',
            tipoCombustivel: 'gasolina',
            odometroInicial: 1000,
          ),
        );
    await expectLater(
      db
          .into(db.configuracoesVeiculo)
          .insert(
            ConfiguracoesVeiculoCompanion.insert(
              id: 'config-2',
              tipoCombustivel: 'etanol',
              odometroInicial: 2000,
            ),
          ),
      throwsA(anything),
    );
  });
}
