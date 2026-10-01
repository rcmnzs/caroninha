import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/banco/enums.dart';
import '../../../../core/utils/formatadores.dart';
import '../../caronas/presentation/periodo_caronas.dart';
import '../../caronas/presentation/seletor_periodo.dart';
import '../data/transacao_providers.dart';
import '../domain/resumo_financeiro.dart';
import '../domain/transacao.dart';

class FinanceiroScreen extends ConsumerStatefulWidget {
  const FinanceiroScreen({super.key});

  @override
  ConsumerState<FinanceiroScreen> createState() => _FinanceiroScreenState();
}

class _FinanceiroScreenState extends ConsumerState<FinanceiroScreen> {
  PeriodoCaronas _periodo = PeriodoCaronas.esteMes;

  @override
  Widget build(BuildContext context) {
    final filtroCarona = filtroDoPeriodo(_periodo);
    final periodo = (inicio: filtroCarona.inicio, fim: filtroCarona.fim);
    final transacoes = ref.watch(transacoesPorPeriodoProvider(periodo));

    return Scaffold(
      appBar: AppBar(title: const Text('Financeiro')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = MediaQuery.sizeOf(context).width >= 840;
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isWide ? 900 : double.infinity,
                ),
                child: Padding(
                  padding: EdgeInsets.all(isWide ? 24 : 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SeletorPeriodo(
                        periodoSelecionado: _periodo,
                        onChanged: (periodo) =>
                            setState(() => _periodo = periodo),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: transacoes.when(
                          data: _conteudo,
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (_, _) => _estadoDeErro(periodo),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _abrirFormulario(context),
        icon: const Icon(Icons.add),
        label: const Text('Nova despesa'),
      ),
    );
  }

  Widget _conteudo(List<Transacao> transacoes) {
    final resumo = calcularResumo(transacoes);
    if (transacoes.isEmpty) {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _CartoesResumo(resumo: resumo)),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Nenhum lançamento neste período.')),
          ),
        ],
      );
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _CartoesResumo(resumo: resumo)),
        SliverPadding(
          padding: const EdgeInsets.only(top: 8, bottom: 80),
          sliver: SliverList.separated(
            itemCount: transacoes.length,
            itemBuilder: (context, index) => _LancamentoFinanceiro(
              transacao: transacoes[index],
              onTap: transacoes[index].tipo == TipoTransacao.despesa
                  ? () => _abrirFormulario(context, transacoes[index].id)
                  : null,
            ),
            separatorBuilder: (context, index) => const Divider(height: 1),
          ),
        ),
      ],
    );
  }

  Widget _estadoDeErro(PeriodoFinanceiro periodo) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cloud_off_outlined, size: 40),
          const SizedBox(height: 12),
          const Text('Não foi possível carregar os lançamentos.'),
          TextButton.icon(
            onPressed: () =>
                ref.invalidate(transacoesPorPeriodoProvider(periodo)),
            icon: const Icon(Icons.refresh),
            label: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }

  Future<void> _abrirFormulario(
    BuildContext context, [
    String? transacaoId,
  ]) async {
    final rota = transacaoId == null
        ? '/financeiro/nova'
        : '/financeiro/$transacaoId/editar';
    final salvo = await context.push<bool>(rota);
    if (!context.mounted || salvo != true) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          transacaoId == null
              ? 'Despesa salva com sucesso.'
              : 'Despesa atualizada com sucesso.',
        ),
      ),
    );
  }
}

class _CartoesResumo extends StatelessWidget {
  const _CartoesResumo({required this.resumo});

  final ResumoFinanceiro resumo;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final largura = constraints.maxWidth >= 700
            ? (constraints.maxWidth - 24) / 3
            : constraints.maxWidth;
        final negativo = resumo.saldoCentavos < 0;
        final saldoLegenda = negativo
            ? 'Saldo negativo'
            : resumo.saldoCentavos == 0
            ? 'Saldo zerado'
            : 'Saldo positivo';

        return Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            SizedBox(
              width: largura,
              child: _CartaoValor(
                titulo: 'Receita',
                valorCentavos: resumo.receitaCentavos,
                icone: Icons.south_west,
                cor: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(
              width: largura,
              child: _CartaoValor(
                titulo: 'Despesa',
                valorCentavos: resumo.despesaCentavos,
                icone: Icons.north_east,
                cor: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(
              width: largura,
              child: _CartaoValor(
                titulo: 'Saldo',
                valorCentavos: resumo.saldoCentavos,
                icone: negativo ? Icons.trending_down : Icons.trending_up,
                cor: negativo
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
                legenda: saldoLegenda,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CartaoValor extends StatelessWidget {
  const _CartaoValor({
    required this.titulo,
    required this.valorCentavos,
    required this.icone,
    required this.cor,
    this.legenda,
  });

  final String titulo;
  final int valorCentavos;
  final IconData icone;
  final Color cor;
  final String? legenda;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icone, color: cor, size: 20),
                const SizedBox(width: 8),
                Text(titulo, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              formatarCentavos(valorCentavos),
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(color: cor, fontWeight: FontWeight.w700),
            ),
            if (legenda != null) ...[
              const SizedBox(height: 4),
              Text(legenda!, style: TextStyle(color: cor)),
            ],
          ],
        ),
      ),
    );
  }
}

class _LancamentoFinanceiro extends StatelessWidget {
  const _LancamentoFinanceiro({required this.transacao, this.onTap});

  final Transacao transacao;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final receita = transacao.tipo == TipoTransacao.receita;
    final cor = receita
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.tertiary;
    final categoria = switch (transacao.categoria) {
      CategoriaTransacao.combustivel => 'Combustível',
      CategoriaTransacao.pedagio => 'Pedágio',
      CategoriaTransacao.manutencao => 'Manutenção',
      CategoriaTransacao.estacionamento => 'Estacionamento',
      CategoriaTransacao.carona => 'Carona',
      CategoriaTransacao.avulsa => 'Avulsa',
      CategoriaTransacao.outros => 'Outros',
    };
    final descricao = transacao.descricao?.trim();

    return ListTile(
      onTap: onTap,
      leading: Icon(receita ? Icons.south_west : Icons.north_east, color: cor),
      title: Text(categoria),
      subtitle: Text(
        [
          if (descricao != null && descricao.isNotEmpty) descricao,
          formatarData(transacao.data.toLocal()),
          if (receita) 'Receita vinculada à carona',
        ].join(' · '),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        '${receita ? '+' : '−'} ${formatarCentavos(transacao.valorCentavos)}',
        style: Theme.of(context).textTheme.titleSmall
            ?.copyWith(color: cor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
