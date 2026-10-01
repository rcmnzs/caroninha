import '../data/carona_repository.dart';

enum PeriodoCaronas { hoje, estaSemana, esteMes, tudo }

CaronaFiltro filtroDoPeriodo(PeriodoCaronas periodo, {DateTime? agora}) {
  if (periodo == PeriodoCaronas.tudo) {
    return (inicio: null, fim: null, passageiroId: null, pago: null);
  }

  final hoje = agora == null ? DateTime.now() : agora.toLocal();
  final primeiroDia = DateTime(hoje.year, hoje.month, hoje.day);
  late DateTime inicio;
  late DateTime fim;

  switch (periodo) {
    case PeriodoCaronas.hoje:
      inicio = primeiroDia;
      fim = primeiroDia.add(const Duration(days: 1));
    case PeriodoCaronas.estaSemana:
      inicio = primeiroDia.subtract(Duration(days: hoje.weekday - 1));
      fim = inicio.add(const Duration(days: 7));
    case PeriodoCaronas.esteMes:
      inicio = DateTime(hoje.year, hoje.month);
      fim = DateTime(hoje.year, hoje.month + 1);
    case PeriodoCaronas.tudo:
      throw StateError('Periodo Tudo nao possui limites de data.');
  }

  return (
    inicio: inicio.toUtc(),
    fim: fim.toUtc().subtract(const Duration(milliseconds: 1)),
    passageiroId: null,
    pago: null,
  );
}
