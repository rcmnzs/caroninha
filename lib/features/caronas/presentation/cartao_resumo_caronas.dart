import 'package:flutter/material.dart';

import '../../../../core/utils/formatadores.dart';

class CartaoResumoCaronas extends StatelessWidget {
  const CartaoResumoCaronas({
    required this.recebidoCentavos,
    required this.pendenteCentavos,
    super.key,
  });

  final int? recebidoCentavos;
  final int? pendenteCentavos;

  @override
  Widget build(BuildContext context) {
    final esquema = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: _ResumoValor(
                titulo: 'Recebido',
                valor: recebidoCentavos,
                cor: esquema.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _ResumoValor(
                titulo: 'Pendente',
                valor: pendenteCentavos,
                cor: esquema.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResumoValor extends StatelessWidget {
  const _ResumoValor({
    required this.titulo,
    required this.valor,
    required this.cor,
  });

  final String titulo;
  final int? valor;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 4),
        Text(
          valor == null ? '...' : formatarCentavos(valor!),
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(color: cor, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
