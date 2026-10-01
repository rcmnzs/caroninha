import 'package:intl/intl.dart';

String formatarCentavos(int centavos) {
  final valor = centavos / 100;
  final formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  return formatter.format(valor).replaceAll('\u00A0', ' ');
}

String formatarData(DateTime data) {
  return DateFormat('dd/MM/yyyy').format(data);
}
