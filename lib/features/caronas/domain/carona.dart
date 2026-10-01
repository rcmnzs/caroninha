import 'carona_validacao_exception.dart';

class Carona {
  const Carona({
    required this.id,
    required this.passageiroId,
    required this.valorCentavos,
    required this.data,
    required this.pago,
    required this.usuarioId,
    required this.criadoEm,
    required this.atualizadoEm,
    required this.excluido,
    required this.sincronizado,
    this.origem,
    this.destino,
    this.observacao,
  });

  final String id;
  final String passageiroId;
  final int valorCentavos;
  final DateTime data;
  final bool pago;
  final String? origem;
  final String? destino;
  final String? observacao;
  final String usuarioId;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool excluido;
  final bool sincronizado;

  static void validar({required int valorCentavos, required DateTime? data}) {
    if (valorCentavos <= 0) {
      throw const CaronaValidacaoException(
        CampoCaronaInvalido.valorCentavos,
        'O valor da carona deve ser maior que zero.',
      );
    }
    if (data == null) {
      throw const CaronaValidacaoException(
        CampoCaronaInvalido.data,
        'A data da carona e obrigatoria.',
      );
    }
  }

  Carona copyWith({
    String? passageiroId,
    int? valorCentavos,
    DateTime? data,
    bool? pago,
    String? origem,
    String? destino,
    String? observacao,
  }) {
    return Carona(
      id: id,
      passageiroId: passageiroId ?? this.passageiroId,
      valorCentavos: valorCentavos ?? this.valorCentavos,
      data: data ?? this.data,
      pago: pago ?? this.pago,
      origem: origem ?? this.origem,
      destino: destino ?? this.destino,
      observacao: observacao ?? this.observacao,
      usuarioId: usuarioId,
      criadoEm: criadoEm,
      atualizadoEm: atualizadoEm,
      excluido: excluido,
      sincronizado: sincronizado,
    );
  }
}
