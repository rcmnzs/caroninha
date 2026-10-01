import 'package:drift/drift.dart';

import 'enums.dart';

mixin _CamposComuns on Table {
  TextColumn get id => text()();

  TextColumn get usuarioId => text().withDefault(const Constant('local'))();

  DateTimeColumn get criadoEm => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get atualizadoEm =>
      dateTime().withDefault(currentDateAndTime)();

  BoolColumn get excluido => boolean().withDefault(const Constant(false))();

  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}

@TableIndex(name: 'idx_passageiros_sincronizado', columns: {#sincronizado})
@TableIndex(name: 'idx_passageiros_atualizado_em', columns: {#atualizadoEm})
class Passageiros extends Table with _CamposComuns {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get nome => text()();

  TextColumn get telefone => text().nullable()();
}

@TableIndex(name: 'idx_caronas_data', columns: {#data})
@TableIndex(name: 'idx_caronas_passageiro_id', columns: {#passageiroId})
@TableIndex(name: 'idx_caronas_pago', columns: {#pago})
@TableIndex(name: 'idx_caronas_sincronizado', columns: {#sincronizado})
@TableIndex(name: 'idx_caronas_atualizado_em', columns: {#atualizadoEm})
class Caronas extends Table with _CamposComuns {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get passageiroId => text().references(Passageiros, #id)();

  IntColumn get valorCentavos => integer()();

  DateTimeColumn get data => dateTime()();

  BoolColumn get pago => boolean().withDefault(const Constant(false))();

  TextColumn get origem => text().nullable()();

  TextColumn get destino => text().nullable()();

  TextColumn get observacao => text().nullable()();
}

@TableIndex(name: 'idx_transacoes_data', columns: {#data})
@TableIndex(name: 'idx_transacoes_tipo_categoria', columns: {#tipo, #categoria})
@TableIndex(name: 'idx_transacoes_sincronizado', columns: {#sincronizado})
@TableIndex(name: 'idx_transacoes_atualizado_em', columns: {#atualizadoEm})
@TableIndex(
  name: 'idx_transacoes_carona_id_unique',
  columns: {#caronaId},
  unique: true,
)
class Transacoes extends Table with _CamposComuns {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get tipo => text().map(const TipoTransacaoConverter())();

  TextColumn get categoria => text().map(const CategoriaTransacaoConverter())();

  IntColumn get valorCentavos => integer()();

  DateTimeColumn get data => dateTime()();

  TextColumn get descricao => text().nullable()();

  TextColumn get caronaId => text().nullable().references(Caronas, #id)();
}

@TableIndex(name: 'idx_abastecimentos_sincronizado', columns: {#sincronizado})
@TableIndex(name: 'idx_abastecimentos_atualizado_em', columns: {#atualizadoEm})
@TableIndex(
  name: 'idx_abastecimentos_transacao_id_unique',
  columns: {#transacaoId},
  unique: true,
)
class Abastecimentos extends Table with _CamposComuns {
  @override
  Set<Column<Object>> get primaryKey => {id};

  DateTimeColumn get data => dateTime()();

  RealColumn get litros => real()();

  IntColumn get precoLitroCentavos => integer()();

  IntColumn get valorTotalCentavos => integer()();

  IntColumn get kmOdometro => integer()();

  TextColumn get transacaoId => text().nullable().references(Transacoes, #id)();
}

@TableIndex(
  name: 'idx_configuracoes_veiculo_sincronizado',
  columns: {#sincronizado},
)
@TableIndex(
  name: 'idx_configuracoes_veiculo_atualizado_em',
  columns: {#atualizadoEm},
)
@TableIndex(
  name: 'idx_configuracoes_veiculo_usuario_id_unique',
  columns: {#usuarioId},
  unique: true,
)
class ConfiguracoesVeiculo extends Table with _CamposComuns {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get tipoCombustivel => text()();

  IntColumn get odometroInicial => integer()();

  RealColumn get metaConsumoKml => real().nullable()();

  IntColumn get metaMensalCentavos => integer().nullable()();
}
