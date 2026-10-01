import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/banco/app_database.dart' as banco;
import '../domain/passageiro.dart';

class PassageiroRepository {
  PassageiroRepository(this._database);

  final banco.AppDatabase _database;

  Future<Passageiro> criar({
    required String nome,
    String? telefone,
    String usuarioId = 'local',
  }) async {
    final nomeNormalizado = nome.trim();
    if (nomeNormalizado.isEmpty) {
      throw ArgumentError.value(nome, 'nome');
    }

    final agora = DateTime.now().toUtc();
    final linha = await _database
        .into(_database.passageiros)
        .insertReturning(
          banco.PassageirosCompanion.insert(
            id: const Uuid().v4(),
            usuarioId: Value(usuarioId),
            criadoEm: Value(agora),
            atualizadoEm: Value(agora),
            nome: nomeNormalizado,
            telefone: Value(telefone),
            sincronizado: const Value(false),
          ),
        );
    return _mapear(linha);
  }

  Future<List<Passageiro>> buscarPorNome(String nome) async {
    final consulta = normalizarNomePassageiro(nome.trim());
    final linhas =
        await (_database.select(_database.passageiros)
              ..where((tbl) => tbl.excluido.equals(false))
              ..orderBy([(tbl) => OrderingTerm.asc(tbl.nome)]))
            .get();
    if (consulta.isEmpty) return linhas.map(_mapear).toList(growable: false);

    return linhas
        .where(
          (linha) => normalizarNomePassageiro(linha.nome).contains(consulta),
        )
        .map(_mapear)
        .toList(growable: false);
  }

  Future<List<Passageiro>> listar() async {
    final linhas =
        await (_database.select(_database.passageiros)
              ..where((tbl) => tbl.excluido.equals(false))
              ..orderBy([(tbl) => OrderingTerm.asc(tbl.nome)]))
            .get();
    return linhas.map(_mapear).toList(growable: false);
  }

  Future<void> excluirLogicamente(String id) async {
    final linha =
        await (_database.select(_database.passageiros)
              ..where((tbl) => tbl.id.equals(id) & tbl.excluido.equals(false)))
            .getSingleOrNull();
    if (linha == null) return;

    await (_database.update(
      _database.passageiros,
    )..where((tbl) => tbl.id.equals(id))).write(
      banco.PassageirosCompanion(
        excluido: const Value(true),
        atualizadoEm: Value(_atualizadoEmDepoisDe(linha.atualizadoEm)),
        sincronizado: const Value(false),
      ),
    );
  }
}

String normalizarNomePassageiro(String nome) {
  var normalizado = nome.toLowerCase();
  const substituicoes = {
    'á': 'a',
    'à': 'a',
    'â': 'a',
    'ã': 'a',
    'ä': 'a',
    'é': 'e',
    'è': 'e',
    'ê': 'e',
    'ë': 'e',
    'í': 'i',
    'ì': 'i',
    'î': 'i',
    'ï': 'i',
    'ó': 'o',
    'ò': 'o',
    'ô': 'o',
    'õ': 'o',
    'ö': 'o',
    'ú': 'u',
    'ù': 'u',
    'û': 'u',
    'ü': 'u',
    'ç': 'c',
  };
  for (final substituicao in substituicoes.entries) {
    normalizado = normalizado.replaceAll(substituicao.key, substituicao.value);
  }
  return normalizado;
}

Passageiro _mapear(banco.Passageiro linha) => Passageiro(
  id: linha.id,
  nome: linha.nome,
  telefone: linha.telefone,
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
