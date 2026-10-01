import 'package:caroninha_do_cesinha/core/banco/enums.dart';
import 'package:caroninha_do_cesinha/features/financeiro/domain/resumo_financeiro.dart';
import 'package:caroninha_do_cesinha/features/financeiro/domain/transacao.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('calcula total somente de receitas', () {
    final resumo = calcularResumo([
      _transacao(tipo: TipoTransacao.receita, valor: 2500),
      _transacao(tipo: TipoTransacao.receita, valor: 3200),
    ]);

    expect(resumo.receitaCentavos, 5700);
    expect(resumo.despesaCentavos, 0);
    expect(resumo.saldoCentavos, 5700);
  });

  test('calcula total somente de despesas', () {
    final resumo = calcularResumo([
      _transacao(tipo: TipoTransacao.despesa, valor: 1900),
      _transacao(tipo: TipoTransacao.despesa, valor: 3100),
    ]);

    expect(resumo.receitaCentavos, 0);
    expect(resumo.despesaCentavos, 5000);
    expect(resumo.saldoCentavos, -5000);
  });

  test('calcula saldo negativo quando despesas superam receitas', () {
    final resumo = calcularResumo([
      _transacao(tipo: TipoTransacao.receita, valor: 2500),
      _transacao(tipo: TipoTransacao.despesa, valor: 4100),
    ]);

    expect(resumo.saldoCentavos, -1600);
  });

  test('retorna zero para lista vazia', () {
    final resumo = calcularResumo(const <Transacao>[]);

    expect(resumo.receitaCentavos, 0);
    expect(resumo.despesaCentavos, 0);
    expect(resumo.saldoCentavos, 0);
  });

  test('mantem precisao para valores grandes em centavos', () {
    final resumo = calcularResumo([
      _transacao(tipo: TipoTransacao.receita, valor: 900000000000000),
      _transacao(tipo: TipoTransacao.despesa, valor: 125000000000000),
    ]);

    expect(resumo.receitaCentavos, 900000000000000);
    expect(resumo.despesaCentavos, 125000000000000);
    expect(resumo.saldoCentavos, 775000000000000);
  });

  test('ignora transacoes com exclusao logica', () {
    final resumo = calcularResumo([
      _transacao(tipo: TipoTransacao.receita, valor: 5000, excluido: true),
      _transacao(tipo: TipoTransacao.despesa, valor: 2500),
    ]);

    expect(resumo.receitaCentavos, 0);
    expect(resumo.despesaCentavos, 2500);
    expect(resumo.saldoCentavos, -2500);
  });
}

Transacao _transacao({
  required TipoTransacao tipo,
  required int valor,
  bool excluido = false,
}) {
  final agora = DateTime.utc(2026, 1, 1);
  return Transacao(
    id: 'transacao-$valor-$tipo-$excluido',
    tipo: tipo,
    categoria: tipo == TipoTransacao.receita
        ? CategoriaTransacao.carona
        : CategoriaTransacao.outros,
    valorCentavos: valor,
    data: agora,
    usuarioId: 'local',
    criadoEm: agora,
    atualizadoEm: agora,
    excluido: excluido,
    sincronizado: false,
  );
}
