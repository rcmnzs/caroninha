import 'package:caroninha_do_cesinha/features/caronas/data/caronas_providers.dart';
import 'package:caroninha_do_cesinha/features/caronas/domain/carona.dart';
import 'package:caroninha_do_cesinha/features/caronas/domain/carona_com_passageiro.dart';
import 'package:caroninha_do_cesinha/features/caronas/domain/passageiro.dart';
import 'package:caroninha_do_cesinha/features/caronas/presentation/caronas_screen.dart';
import 'package:caroninha_do_cesinha/features/caronas/presentation/periodo_caronas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('exibe estado vazio quando nao ha caronas', (tester) async {
    await _montarTela(tester);

    expect(find.text('Nenhuma carona neste período.'), findsOneWidget);
    expect(find.text('Nova carona'), findsOneWidget);
  });

  testWidgets('exibe caronas pagas e pendentes com totais do período', (
    tester,
  ) async {
    final agora = DateTime.now().toUtc();
    final itens = [
      _criarItem(nome: 'Marina', data: agora, valorCentavos: 2500, pago: true),
      _criarItem(
        nome: 'Carlos',
        data: agora.subtract(const Duration(minutes: 10)),
        valorCentavos: 1700,
        pago: false,
      ),
    ];

    await _montarTela(
      tester,
      itens: itens,
      recebidoCentavos: 2500,
      pendenteCentavos: 1700,
    );

    expect(find.text('Marina'), findsOneWidget);
    expect(find.text('Carlos'), findsOneWidget);
    expect(find.text('Pago'), findsOneWidget);
    expect(find.text('Pendente'), findsNWidgets(2));
    expect(
      find.descendant(
        of: find.byType(Card).first,
        matching: find.text('R\$ 25,00'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(Card).first,
        matching: find.text('R\$ 17,00'),
      ),
      findsOneWidget,
    );
  });
}

Future<void> _montarTela(
  WidgetTester tester, {
  List<CaronaComPassageiro> itens = const [],
  int recebidoCentavos = 0,
  int pendenteCentavos = 0,
}) async {
  final filtro = filtroDoPeriodo(PeriodoCaronas.esteMes);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        caronasFiltradasProvider(filtro)
            .overrideWith((ref) => Stream.value(itens)),
        resumoCaronasProvider(filtro).overrideWith(
          (ref) => AsyncData((
            recebidoCentavos: recebidoCentavos,
            pendenteCentavos: pendenteCentavos,
          )),
        ),
      ],
      child: const MaterialApp(home: CaronasScreen()),
    ),
  );
  await tester.pumpAndSettle();
}

CaronaComPassageiro _criarItem({
  required String nome,
  required DateTime data,
  required int valorCentavos,
  required bool pago,
}) {
  final passageiroId = 'pass-${nome.toLowerCase()}';
  return CaronaComPassageiro(
    carona: Carona(
      id: 'car-${nome.toLowerCase()}',
      passageiroId: passageiroId,
      valorCentavos: valorCentavos,
      data: data,
      pago: pago,
      usuarioId: 'local',
      criadoEm: data,
      atualizadoEm: data,
      excluido: false,
      sincronizado: false,
    ),
    passageiro: Passageiro(
      id: passageiroId,
      nome: nome,
      usuarioId: 'local',
      criadoEm: data,
      atualizadoEm: data,
      excluido: false,
      sincronizado: false,
    ),
  );
}
