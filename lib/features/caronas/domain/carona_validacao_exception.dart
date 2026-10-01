enum CampoCaronaInvalido { valorCentavos, data }

class CaronaValidacaoException implements Exception {
  const CaronaValidacaoException(this.campo, this.mensagem);

  final CampoCaronaInvalido campo;
  final String mensagem;

  @override
  String toString() => mensagem;
}
