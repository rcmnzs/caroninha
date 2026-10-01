import 'package:caroninha_do_cesinha/core/banco/app_database.dart';
import 'package:caroninha_do_cesinha/core/banco/enums.dart';
import 'package:caroninha_do_cesinha/features/financeiro/data/transacao_repository.dart';
import 'package:caroninha_do_cesinha/features/financeiro/domain/transacao.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late TransacaoRepository repository;

  setUp(() {
    database = AppDatabase.memory();
    repository = TransacaoRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('cria, edita e exclui despesa logicamente', () async {
    final criada = await repository.criar(
      tipo: TipoTransacao.despesa,
      categoria: CategoriaTransacao.pedagio,
      valorCentavos: 1200,
      data: DateTime.utc(2026, 2, 1),
      descricao: 'Pedágio',
    );
    final editada = await repository.editar(
      Transacao(
        id: criada.id,
        tipo: criada.tipo,
        categoria: CategoriaTransacao.manutencao,
        valorCentavos: 2500,
        data: DateTime.utc(2026, 2, 2),
        descricao: 'Revisão',
        caronaId: null,
        usuarioId: criada.usuarioId,
        criadoEm: criada.criadoEm,
        atualizadoEm: criada.atualizadoEm,
        excluido: false,
        sincronizado: criada.sincronizado,
      ),
    );

    expect(editada.categoria, CategoriaTransacao.manutencao);
    expect(editada.valorCentavos, 2500);
    expect(editada.atualizadoEm.isAfter(criada.atualizadoEm), isTrue);
    expect(editada.sincronizado, isFalse);

    await repository.excluirLogicamente(criada.id);
    expect(
      (await database.select(database.transacoes).getSingle()).excluido,
      isTrue,
    );
    expect(
      await repository.listarPorPeriodo(DateTime.utc(2026), DateTime.utc(2027)),
      isEmpty,
    );
  });
}
