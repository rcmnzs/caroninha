import 'package:caroninha_do_cesinha/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app renders the tab shell with the expected screens', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: CaroninhaApp()));

    expect(find.text('Caronas'), findsWidgets);
    expect(find.text('Financeiro'), findsOneWidget);
    expect(find.text('Config.'), findsOneWidget);
  });
}
