import '../../../core/banco/enums.dart';
import 'transacao.dart';

class ResumoFinanceiro {
  const ResumoFinanceiro({
    required this.receitaCentavos,
    required this.despesaCentavos,
    required this.saldoCentavos,
  });

  final int receitaCentavos;
  final int despesaCentavos;
  final int saldoCentavos;
}

ResumoFinanceiro calcularResumo(Iterable<Transacao> transacoes) {
  var receitaCentavos = 0;
  var despesaCentavos = 0;

  for (final transacao in transacoes) {
    if (transacao.excluido) continue;
    switch (transacao.tipo) {
      case TipoTransacao.receita:
        receitaCentavos += transacao.valorCentavos;
      case TipoTransacao.despesa:
        despesaCentavos += transacao.valorCentavos;
    }
  }

  return ResumoFinanceiro(
    receitaCentavos: receitaCentavos,
    despesaCentavos: despesaCentavos,
    saldoCentavos: receitaCentavos - despesaCentavos,
  );
}
