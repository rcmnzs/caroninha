import 'package:caroninha_do_cesinha/core/utils/formatadores.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('formatarCentavos', () {
    test('deve formatar valores em reais no padrão brasileiro', () {
      expect(formatarCentavos(123456), 'R\$ 1.234,56');
      expect(formatarCentavos(2500), 'R\$ 25,00');
    });
  });

  group('formatarData', () {
    test('deve formatar datas em dd/MM/yyyy', () {
      expect(formatarData(DateTime(2024, 5, 7)), '07/05/2024');
      expect(formatarData(DateTime(2020, 12, 31)), '31/12/2020');
    });
  });
}
