import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/banco/app_database.dart' as banco;
import '../../../core/banco/enums.dart';
import '../domain/transacao.dart';

class TransacaoRepository {
  TransacaoRepository(this._database);

  final banco.AppDatabase _database;

  Future<Transacao> criar({
    required TipoTransacao tipo,
    required CategoriaTransacao categoria,
    required int valorCentavos,
    required DateTime data,
    String? descricao,
    String? caronaId,
    String usuarioId = 'local',
  }) async {
    if (valorCentavos <= 0) {
      throw ArgumentError.value(valorCentavos, 'valorCentavos');
    }
    final agora = DateTime.now().toUtc();
    final linha = await _database
        .into(_database.transacoes)
        .insertReturning(
          banco.TransacoesCompanion.insert(
            id: const Uuid().v4(),
            tipo: tipo,
            categoria: categoria,
            valorCentavos: valorCentavos,
            data: data.toUtc(),
            descricao: Value(descricao),
            caronaId: Value(caronaId),
            usuarioId: Value(usuarioId),
            criadoEm: Value(agora),
            atualizadoEm: Value(agora),
            sincronizado: const Value(false),
          ),
        );
    return _mapear(linha);
  }

  Future<Transacao> editar(Transacao transacao) async {
    if (transacao.valorCentavos <= 0) {
      throw ArgumentError.value(transacao.valorCentavos, 'valorCentavos');
    }
    final existente = await (_database.select(
      _database.transacoes,
    )..where((tbl) => tbl.id.equals(transacao.id))).getSingleOrNull();
    if (existente == null) {
      throw StateError('Transacao nao encontrada.');
    }

    final agora = _atualizadoEmDepoisDe(existente.atualizadoEm);
    await (_database.update(
      _database.transacoes,
    )..where((tbl) => tbl.id.equals(transacao.id))).write(
      banco.TransacoesCompanion(
        tipo: Value(transacao.tipo),
        categoria: Value(transacao.categoria),
        valorCentavos: Value(transacao.valorCentavos),
        data: Value(transacao.data.toUtc()),
        descricao: Value(transacao.descricao),
        caronaId: Value(transacao.caronaId),
        usuarioId: Value(transacao.usuarioId),
        atualizadoEm: Value(agora),
        excluido: Value(transacao.excluido),
        sincronizado: const Value(false),
      ),
    );

    return _mapear(
      await (_database.select(
        _database.transacoes,
      )..where((tbl) => tbl.id.equals(transacao.id))).getSingle(),
    );
  }

  Future<void> excluirLogicamente(String id) async {
    final existente =
        await (_database.select(_database.transacoes)
              ..where((tbl) => tbl.id.equals(id) & tbl.excluido.equals(false)))
            .getSingleOrNull();
    if (existente == null) return;

    await (_database.update(
      _database.transacoes,
    )..where((tbl) => tbl.id.equals(id))).write(
      banco.TransacoesCompanion(
        excluido: const Value(true),
        atualizadoEm: Value(_atualizadoEmDepoisDe(existente.atualizadoEm)),
        sincronizado: const Value(false),
      ),
    );
  }

  Future<List<Transacao>> listarPorPeriodo(
    DateTime inicio,
    DateTime fim,
  ) async {
    final linhas =
        await (_database.select(_database.transacoes)
              ..where(
                (tbl) =>
                    tbl.excluido.equals(false) &
                    tbl.data.isBiggerOrEqualValue(inicio.toUtc()) &
                    tbl.data.isSmallerOrEqualValue(fim.toUtc()),
              )
              ..orderBy([
                (tbl) => OrderingTerm.desc(tbl.data),
                (tbl) => OrderingTerm.desc(tbl.criadoEm),
              ]))
            .get();
    return linhas.map(_mapear).toList(growable: false);
  }

  Stream<List<Transacao>> watchPorPeriodo(DateTime? inicio, DateTime? fim) {
    final consulta = _database.select(_database.transacoes)
      ..where((tbl) => tbl.excluido.equals(false));
    if (inicio != null) {
      consulta.where((tbl) => tbl.data.isBiggerOrEqualValue(inicio.toUtc()));
    }
    if (fim != null) {
      consulta.where((tbl) => tbl.data.isSmallerOrEqualValue(fim.toUtc()));
    }
    consulta.orderBy([
      (tbl) => OrderingTerm.desc(tbl.data),
      (tbl) => OrderingTerm.desc(tbl.criadoEm),
    ]);
    return consulta.watch().map(
      (linhas) => linhas.map(_mapear).toList(growable: false),
    );
  }

  Future<Transacao?> buscarPorId(String id) async {
    final linha =
        await (_database.select(_database.transacoes)
              ..where((tbl) => tbl.id.equals(id) & tbl.excluido.equals(false)))
            .getSingleOrNull();
    return linha == null ? null : _mapear(linha);
  }

  Future<Transacao?> buscarPorCaronaId(String caronaId) async {
    final linha = await (_database.select(
      _database.transacoes,
    )..where((tbl) => tbl.caronaId.equals(caronaId))).getSingleOrNull();
    return linha == null ? null : _mapear(linha);
  }
}

Transacao _mapear(banco.Transacoe linha) => Transacao(
  id: linha.id,
  tipo: linha.tipo,
  categoria: linha.categoria,
  valorCentavos: linha.valorCentavos,
  data: linha.data.toUtc(),
  descricao: linha.descricao,
  caronaId: linha.caronaId,
  usuarioId: linha.usuarioId,
  criadoEm: linha.criadoEm.toUtc(),
  atualizadoEm: linha.atualizadoEm.toUtc(),
  excluido: linha.excluido,
  sincronizado: linha.sincronizado,
);

DateTime _atualizadoEmDepoisDe(DateTime anterior) {
  final agora = DateTime.now().toUtc();
  final instanteMinimo = anterior.toUtc().add(const Duration(seconds: 1));
  return agora.isAfter(instanteMinimo) ? agora : instanteMinimo;
}
