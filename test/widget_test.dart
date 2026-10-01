import 'package:caroninha_do_cesinha/app.dart';
import 'package:caroninha_do_cesinha/core/banco/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app renders the tab shell with the expected screens', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.memory();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const CaroninhaApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Caronas'), findsWidgets);
    expect(find.text('Financeiro'), findsOneWidget);
    expect(find.text('Config.'), findsOneWidget);

    await database.close();
  });
}
