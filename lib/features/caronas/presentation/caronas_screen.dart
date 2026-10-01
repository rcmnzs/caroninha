import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/formatadores.dart';
import '../data/carona_repository.dart';
import '../data/caronas_providers.dart';
import '../domain/carona_com_passageiro.dart';
import 'cartao_resumo_caronas.dart';
import 'item_carona.dart';
import 'periodo_caronas.dart';
import 'seletor_periodo.dart';

class CaronasScreen extends ConsumerStatefulWidget {
  const CaronasScreen({super.key});

  @override
  ConsumerState<CaronasScreen> createState() => _CaronasScreenState();
}

class _CaronasScreenState extends ConsumerState<CaronasScreen> {
  PeriodoCaronas _periodo = PeriodoCaronas.esteMes;

  @override
  Widget build(BuildContext context) {
    final filtro = filtroDoPeriodo(_periodo);
    final caronas = ref.watch(caronasFiltradasProvider(filtro));
    final resumo = ref.watch(resumoCaronasProvider(filtro));
    final valoresResumo = resumo.when(
      data: (valor) => valor,
      error: (_, _) => null,
      loading: () => null,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Caronas'),
        actions: [
          if (kDebugMode)
            IconButton(
              tooltip: 'Inserir dados de exemplo (debug)',
              onPressed: _inserirDadosDeExemplo,
              icon: const Icon(Icons.science_outlined),
            ),
        ],
      ),
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
                      CartaoResumoCaronas(
                        recebidoCentavos: valoresResumo?.recebidoCentavos,
                        pendenteCentavos: valoresResumo?.pendenteCentavos,
                      ),
                      const SizedBox(height: 16),
                      SeletorPeriodo(
                        periodoSelecionado: _periodo,
                        onChanged: (periodo) {
                          setState(() => _periodo = periodo);
                        },
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: caronas.when(
                          data: _conteudo,
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (erro, pilha) => _estadoDeErro(filtro),
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
        label: const Text('Nova carona'),
      ),
    );
  }

  Widget _conteudo(List<CaronaComPassageiro> caronas) {
    if (caronas.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.directions_car_outlined, size: 44),
            SizedBox(height: 12),
            Text('Nenhuma carona neste período.'),
            SizedBox(height: 4),
            Text('Toque em + para registrar a primeira.'),
          ],
        ),
      );
    }

    final grupos = <DateTime, List<CaronaComPassageiro>>{};
    for (final item in caronas) {
      final dataLocal = item.carona.data.toLocal();
      final dia = DateTime(dataLocal.year, dataLocal.month, dataLocal.day);
      grupos.putIfAbsent(dia, () => []).add(item);
    }

    return ListView(
      children: [
        for (final grupo in grupos.entries) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 12, 4, 4),
            child: Text(
              formatarData(grupo.key),
              style: Theme.of(context).textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          for (final item in grupo.value)
            ItemCarona(
              item: item,
              onTap: () => _abrirFormulario(context, item.carona.id),
            ),
        ],
      ],
    );
  }

  Widget _estadoDeErro(CaronaFiltro filtro) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cloud_off_outlined, size: 40),
          const SizedBox(height: 12),
          const Text('Não foi possível carregar as caronas.'),
          TextButton.icon(
            onPressed: () => ref.invalidate(caronasFiltradasProvider(filtro)),
            icon: const Icon(Icons.refresh),
            label: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }

  Future<void> _abrirFormulario(
    BuildContext context, [
    String? caronaId,
  ]) async {
    final rota = caronaId == null
        ? '/caronas/nova'
        : '/caronas/$caronaId/editar';
    final salvo = await context.push<bool>(rota);
    if (!context.mounted || salvo != true) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          caronaId == null
              ? 'Carona salva com sucesso.'
              : 'Carona atualizada com sucesso.',
        ),
      ),
    );
  }

  Future<void> _inserirDadosDeExemplo() async {
    final repositorio = ref.read(caronaRepositoryProvider);
    final hoje = DateTime.now();
    await repositorio.criar(
      passageiroNome: 'Marina Exemplo',
      valorCentavos: 4500,
      data: hoje,
      pago: true,
    );
    await repositorio.criar(
      passageiroNome: 'Carlos Exemplo',
      valorCentavos: 3200,
      data: hoje.subtract(const Duration(days: 1)),
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Duas caronas de exemplo foram inseridas.')),
    );
  }
}
