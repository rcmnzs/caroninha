import 'package:flutter/material.dart';

import 'periodo_caronas.dart';

class SeletorPeriodo extends StatelessWidget {
  const SeletorPeriodo({
    required this.periodoSelecionado,
    required this.onChanged,
    super.key,
  });

  final PeriodoCaronas periodoSelecionado;
  final ValueChanged<PeriodoCaronas> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SegmentedButton<PeriodoCaronas>(
        showSelectedIcon: false,
        segments: const [
          ButtonSegment(value: PeriodoCaronas.hoje, label: Text('Hoje')),
          ButtonSegment(
            value: PeriodoCaronas.estaSemana,
            label: Text('Esta semana'),
          ),
          ButtonSegment(value: PeriodoCaronas.esteMes, label: Text('Este mês')),
          ButtonSegment(value: PeriodoCaronas.tudo, label: Text('Tudo')),
        ],
        selected: {periodoSelecionado},
        onSelectionChanged: (selecionados) {
          if (selecionados.isNotEmpty) onChanged(selecionados.first);
        },
      ),
    );
  }
}
