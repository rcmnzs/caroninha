import 'package:drift/drift.dart';

enum TipoTransacao { receita, despesa }

enum CategoriaTransacao {
  combustivel,
  pedagio,
  manutencao,
  estacionamento,
  carona,
  avulsa,
  outros,
}

class TipoTransacaoConverter extends TypeConverter<TipoTransacao, String> {
  const TipoTransacaoConverter();

  @override
  TipoTransacao fromSql(String fromDb) {
    return TipoTransacao.values.firstWhere(
      (value) => value.name == fromDb,
      orElse: () => TipoTransacao.despesa,
    );
  }

  @override
  String toSql(TipoTransacao value) {
    return value.name;
  }
}

class CategoriaTransacaoConverter
    extends TypeConverter<CategoriaTransacao, String> {
  const CategoriaTransacaoConverter();

  @override
  CategoriaTransacao fromSql(String fromDb) {
    return CategoriaTransacao.values.firstWhere(
      (value) => value.name == fromDb,
      orElse: () => CategoriaTransacao.outros,
    );
  }

  @override
  String toSql(CategoriaTransacao value) {
    return value.name;
  }
}
