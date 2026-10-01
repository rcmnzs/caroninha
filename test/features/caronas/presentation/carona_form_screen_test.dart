import 'package:caroninha_do_cesinha/core/banco/app_database.dart';
import 'package:caroninha_do_cesinha/features/caronas/data/carona_repository.dart';
import 'package:caroninha_do_cesinha/features/caronas/presentation/carona_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.memory();
  });

  tearDown(() async {
    await database.close();
  });

  testWidgets('mostra validacoes de nome e valor', (tester) async {
    await _montarFormulario(tester, database: database);

    await tester.tap(find.byKey(const Key('salvarCarona')));
    await tester.pumpAndSettle();

    expect(find.text('Informe o nome do passageiro.'), findsOneWidget);
    expect(find.text('O valor deve ser maior que zero.'), findsOneWidget);
    await _desmontar(tester);
  });

  testWidgets('salva uma carona com passageiro novo sem gerar transacao', (
    tester,
  ) async {
    await _montarFormulario(tester, database: database);

    await tester.enterText(
      find.byKey(const Key('nomePassageiro')),
      'Larissa Exemplo',
    );
    await tester.enterText(find.byKey(const Key('valorCarona')), '3250');
    await tester.tap(find.byKey(const Key('pagoSwitch')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('salvarCarona')));
    await tester.pumpAndSettle();

    final carona = (await database.select(database.caronas).getSingle());
    final passageiro = (await database
        .select(database.passageiros)
        .getSingle());
    expect(carona.valorCentavos, 3250);
    expect(carona.pago, isTrue);
    expect(carona.data, isNotNull);
    expect(passageiro.nome, 'Larissa Exemplo');
    expect(await database.select(database.transacoes).get(), isEmpty);
    await _desmontar(tester);
  });

  testWidgets('carrega dados e edita carona existente', (tester) async {
    final criada = await CaronaRepository(database).criar(
      passageiroNome: 'Mateus',
      valorCentavos: 1500,
      data: DateTime.utc(2026, 4, 5),
    );
    await _montarFormulario(tester, database: database, caronaId: criada.id);

    final campoValor = tester.widget<TextFormField>(
      find.byKey(const Key('valorCarona')),
    );
    expect(campoValor.controller?.text, 'R\$ 15,00');
    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('nomePassageiro')))
          .controller
          ?.text,
      'Mateus',
    );

    await tester.enterText(find.byKey(const Key('valorCarona')), '1800');
    await tester.tap(find.byKey(const Key('salvarCarona')));
    await tester.pumpAndSettle();

    final editada = await database.select(database.caronas).getSingle();
    expect(editada.id, criada.id);
    expect(editada.valorCentavos, 1800);
    expect(editada.sincronizado, isFalse);
    await _desmontar(tester);
  });

  testWidgets('confirma exclusao logica de carona', (tester) async {
    final criada = await CaronaRepository(database).criar(
      passageiroNome: 'Camila',
      valorCentavos: 2200,
      data: DateTime.utc(2026, 5, 7),
    );
    await _montarFormulario(tester, database: database, caronaId: criada.id);

    await tester.tap(find.byKey(const Key('excluirCarona')));
    await tester.pumpAndSettle();
    expect(find.text('Excluir carona?'), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirmarExclusaoCarona')));
    await tester.pumpAndSettle();

    final registro = await database.select(database.caronas).getSingle();
    expect(registro.excluido, isTrue);
    expect(await database.select(database.transacoes).get(), isEmpty);
    await _desmontar(tester);
  });
}

Future<void> _montarFormulario(
  WidgetTester tester, {
  required AppDatabase database,
  String? caronaId,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(database)],
      child: MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (_) => CaronaFormScreen(caronaId: caronaId),
                    ),
                  );
                },
                child: const Text('Abrir formulário'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Abrir formulário'));
  await tester.pumpAndSettle();
}

Future<void> _desmontar(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump();
}
