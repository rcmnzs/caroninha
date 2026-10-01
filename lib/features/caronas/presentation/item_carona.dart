import 'package:flutter/material.dart';

import '../../../../core/utils/formatadores.dart';
import '../domain/carona_com_passageiro.dart';

class ItemCarona extends StatelessWidget {
  const ItemCarona({required this.item, this.onTap, super.key});

  final CaronaComPassageiro item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final esquema = Theme.of(context).colorScheme;
    final pago = item.carona.pago;
    final cor = pago ? esquema.primary : esquema.tertiary;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      onTap: onTap,
      leading: Icon(
        pago ? Icons.check_circle : Icons.schedule,
        color: cor,
        semanticLabel: pago ? 'Pago' : 'Pendente',
      ),
      title: Text(item.passageiro.nome),
      subtitle: Text(
        pago ? 'Pago' : 'Pendente',
        style: TextStyle(color: cor, fontWeight: FontWeight.w600),
      ),
      trailing: Text(
        formatarCentavos(item.carona.valorCentavos),
        style: Theme.of(context).textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
