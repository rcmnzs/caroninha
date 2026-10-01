import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/banco/app_database.dart' as banco;
import '../domain/carona.dart';
import '../domain/carona_com_passageiro.dart';
import '../domain/passageiro.dart';
import 'passageiro_repository.dart';

typedef CaronaFiltro = ({
  DateTime? inicio,
  DateTime? fim,
  String? passageiroId,
  bool? pago,
});

class CaronaRepository {
  CaronaRepository(this._database);

  final banco.AppDatabase _database;

  Future<Carona> criar({
    required String passageiroNome,
    String? passageiroTelefone,
    required int valorCentavos,
    required DateTime? data,
    bool pago = false,
    String? origem,
    String? destino,
    String? observacao,
    String usuarioId = 'local',
  }) async {
    Carona.validar(valorCentavos: valorCentavos, data: data);
    final nome = passageiroNome.trim();
    if (nome.isEmpty) {
      throw ArgumentError.value(passageiroNome, 'passageiroNome');
    }

    return _database.transaction(() async {
      final agora = DateTime.now().toUtc();
      final passageiros = await (_database.select(
        _database.passageiros,
      )..where((tbl) => tbl.excluido.equals(false))).get();
      banco.Passageiro? passageiroExistente;
      for (final passageiro in passageiros) {
        if (normalizarNomePassageiro(passageiro.nome) ==
            normalizarNomePassageiro(nome)) {
          passageiroExistente = passageiro;
          break;
        }
      }

      final passageiro =
          passageiroExistente ??
          await _database
              .into(_database.passageiros)
              .insertReturning(
                banco.PassageirosCompanion.insert(
                  id: const Uuid().v4(),
                  usuarioId: Value(usuarioId),
                  criadoEm: Value(agora),
                  atualizadoEm: Value(agora),
                  nome: nome,
                  telefone: Value(passageiroTelefone),
                  sincronizado: const Value(false),
                ),
              );

      final carona = await _database
          .into(_database.caronas)
          .insertReturning(
            banco.CaronasCompanion.insert(
              id: const Uuid().v4(),
              passageiroId: passageiro.id,
              valorCentavos: valorCentavos,
              data: data!.toUtc(),
              pago: Value(pago),
              origem: Value(origem),
              destino: Value(destino),
              observacao: Value(observacao),
              usuarioId: Value(usuarioId),
              criadoEm: Value(agora),
              atualizadoEm: Value(agora),
              sincronizado: const Value(false),
            ),
          );
      return _mapearCarona(carona);
    });
  }

  Future<Carona> editar(Carona carona) async {
    Carona.validar(valorCentavos: carona.valorCentavos, data: carona.data);
    final passageiro =
        await (_database.select(_database.passageiros)..where(
              (tbl) =>
                  tbl.id.equals(carona.passageiroId) &
                  tbl.excluido.equals(false),
            ))
            .getSingleOrNull();
    if (passageiro == null) {
      throw StateError('Passageiro ativo nao encontrado.');
    }

    final existente =
        await (_database.select(_database.caronas)..where(
              (tbl) => tbl.id.equals(carona.id) & tbl.excluido.equals(false),
            ))
            .getSingleOrNull();
    if (existente == null) {
      throw StateError('Carona ativa nao encontrada.');
    }

    final agora = _atualizadoEmDepoisDe(existente.atualizadoEm);
    await (_database.update(
      _database.caronas,
    )..where((tbl) => tbl.id.equals(carona.id))).write(
      banco.CaronasCompanion(
        passageiroId: Value(carona.passageiroId),
        valorCentavos: Value(carona.valorCentavos),
        data: Value(carona.data.toUtc()),
        pago: Value(carona.pago),
        origem: Value(carona.origem),
        destino: Value(carona.destino),
        observacao: Value(carona.observacao),
        atualizadoEm: Value(agora),
        sincronizado: const Value(false),
      ),
    );

    return _mapearCarona(
      (await (_database.select(
        _database.caronas,
      )..where((tbl) => tbl.id.equals(carona.id))).getSingle()),
    );
  }

  Future<void> excluirLogicamente(String id) async {
    final existente =
        await (_database.select(_database.caronas)
              ..where((tbl) => tbl.id.equals(id) & tbl.excluido.equals(false)))
            .getSingleOrNull();
    if (existente == null) return;

    await (_database.update(
      _database.caronas,
    )..where((tbl) => tbl.id.equals(id))).write(
      banco.CaronasCompanion(
        excluido: const Value(true),
        atualizadoEm: Value(_atualizadoEmDepoisDe(existente.atualizadoEm)),
        sincronizado: const Value(false),
      ),
    );
  }

  Future<List<CaronaComPassageiro>> listarPorData({
    CaronaFiltro filtro = const (
      inicio: null,
      fim: null,
      passageiroId: null,
      pago: null,
    ),
  }) async {
    final consulta = _consulta(filtro);
    final linhas = await consulta.get();
    return linhas
        .map(
          (linha) => CaronaComPassageiro(
            carona: _mapearCarona(linha.readTable(_database.caronas)),
            passageiro: _mapearPassageiro(
              linha.readTable(_database.passageiros),
            ),
          ),
        )
        .toList(growable: false);
  }

  Future<CaronaComPassageiro?> buscarPorId(String id) async {
    final linha =
        await (_database.select(_database.caronas).join([
              innerJoin(
                _database.passageiros,
                _database.passageiros.id.equalsExp(
                  _database.caronas.passageiroId,
                ),
              ),
            ])..where(
              _database.caronas.id.equals(id) &
                  _database.caronas.excluido.equals(false),
            ))
            .getSingleOrNull();
    if (linha == null) return null;

    return CaronaComPassageiro(
      carona: _mapearCarona(linha.readTable(_database.caronas)),
      passageiro: _mapearPassageiro(linha.readTable(_database.passageiros)),
    );
  }

  Stream<List<CaronaComPassageiro>> watchFiltradas({
    CaronaFiltro filtro = const (
      inicio: null,
      fim: null,
      passageiroId: null,
      pago: null,
    ),
  }) {
    return _consulta(filtro).watch().map(
      (linhas) => linhas
          .map(
            (linha) => CaronaComPassageiro(
              carona: _mapearCarona(linha.readTable(_database.caronas)),
              passageiro: _mapearPassageiro(
                linha.readTable(_database.passageiros),
              ),
            ),
          )
          .toList(growable: false),
    );
  }

  Future<int> totalRecebido(DateTime inicio, DateTime fim) =>
      _calcularTotal(inicio, fim, pago: true);

  Future<int> totalPendente(DateTime inicio, DateTime fim) =>
      _calcularTotal(inicio, fim, pago: false);

  Future<int> _calcularTotal(
    DateTime inicio,
    DateTime fim, {
    required bool pago,
  }) async {
    final total = _database.caronas.valorCentavos.sum();
    final consulta = _database.selectOnly(_database.caronas)
      ..addColumns([total])
      ..where(
        _database.caronas.excluido.equals(false) &
            _database.caronas.pago.equals(pago) &
            _database.caronas.data.isBiggerOrEqualValue(inicio.toUtc()) &
            _database.caronas.data.isSmallerOrEqualValue(fim.toUtc()),
      );
    final linha = await consulta.getSingle();
    return linha.read(total) ?? 0;
  }

  JoinedSelectStatement<HasResultSet, dynamic> _consulta(CaronaFiltro filtro) {
    final consulta = _database.select(_database.caronas).join([
      innerJoin(
        _database.passageiros,
        _database.passageiros.id.equalsExp(_database.caronas.passageiroId),
      ),
    ])..where(_database.caronas.excluido.equals(false));

    if (filtro.inicio case final inicio?) {
      consulta.where(
        _database.caronas.data.isBiggerOrEqualValue(inicio.toUtc()),
      );
    }
    if (filtro.fim case final fim?) {
      consulta.where(_database.caronas.data.isSmallerOrEqualValue(fim.toUtc()));
    }
    if (filtro.passageiroId case final passageiroId?) {
      consulta.where(_database.caronas.passageiroId.equals(passageiroId));
    }
    if (filtro.pago case final pago?) {
      consulta.where(_database.caronas.pago.equals(pago));
    }

    consulta.orderBy([
      OrderingTerm.desc(_database.caronas.data),
      OrderingTerm.desc(_database.caronas.criadoEm),
    ]);
    return consulta;
  }
}

Carona _mapearCarona(banco.Carona linha) => Carona(
  id: linha.id,
  passageiroId: linha.passageiroId,
  valorCentavos: linha.valorCentavos,
  data: linha.data.toUtc(),
  pago: linha.pago,
  origem: linha.origem,
  destino: linha.destino,
  observacao: linha.observacao,
  usuarioId: linha.usuarioId,
  criadoEm: linha.criadoEm.toUtc(),
  atualizadoEm: linha.atualizadoEm.toUtc(),
  excluido: linha.excluido,
  sincronizado: linha.sincronizado,
);

Passageiro _mapearPassageiro(banco.Passageiro linha) => Passageiro(
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
