import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/caronas/presentation/carona_form_screen.dart';
import '../../features/caronas/presentation/caronas_screen.dart';
import '../../features/configuracoes/presentation/configuracoes_placeholder_screen.dart';
import '../../features/financeiro/presentation/despesa_form_screen.dart';
import '../../features/financeiro/presentation/financeiro_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/caronas',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/caronas',
                builder: (context, state) => const CaronasScreen(),
                routes: [
                  GoRoute(
                    path: 'nova',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) =>
                        _paginaDoFormulario(context, state),
                  ),
                  GoRoute(
                    path: ':id/editar',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) => _paginaDoFormulario(
                      context,
                      state,
                      caronaId: state.pathParameters['id'],
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/financeiro',
                builder: (context, state) => const FinanceiroScreen(),
                routes: [
                  GoRoute(
                    path: 'nova',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) =>
                        _paginaDespesa(context, state),
                  ),
                  GoRoute(
                    path: ':id/editar',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) => _paginaDespesa(
                      context,
                      state,
                      transacaoId: state.pathParameters['id'],
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/configuracoes',
                builder: (context, state) =>
                    const ConfiguracoesPlaceholderScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static Page<void> _paginaDoFormulario(
    BuildContext context,
    GoRouterState state, {
    String? caronaId,
  }) {
    final formulario = CaronaFormScreen(caronaId: caronaId);
    if (MediaQuery.sizeOf(context).width < 840) {
      return MaterialPage<void>(key: state.pageKey, child: formulario);
    }

    return CustomTransitionPage<void>(
      key: state.pageKey,
      opaque: false,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      barrierLabel: 'Formulário de carona',
      child: Center(
        child: Dialog(
          child: SizedBox(
            width: 620,
            height: MediaQuery.sizeOf(context).height - 64,
            child: formulario,
          ),
        ),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }

  static Page<void> _paginaDespesa(
    BuildContext context,
    GoRouterState state, {
    String? transacaoId,
  }) {
    final formulario = DespesaFormScreen(transacaoId: transacaoId);
    if (MediaQuery.sizeOf(context).width < 840) {
      return MaterialPage<void>(key: state.pageKey, child: formulario);
    }

    return CustomTransitionPage<void>(
      key: state.pageKey,
      opaque: false,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      barrierLabel: 'Formulário de despesa',
      child: Center(
        child: Dialog(
          child: SizedBox(
            width: 620,
            height: MediaQuery.sizeOf(context).height - 64,
            child: formulario,
          ),
        ),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}

class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 840;

    if (isWide) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) => navigationShell.goBranch(index),
              labelType: NavigationRailLabelType.selected,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.directions_car_outlined),
                  selectedIcon: Icon(Icons.directions_car),
                  label: Text('Caronas'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  selectedIcon: Icon(Icons.account_balance_wallet),
                  label: Text('Financeiro'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Config.'),
                ),
              ],
            ),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.directions_car_outlined),
            selectedIcon: Icon(Icons.directions_car),
            label: 'Caronas',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'Financeiro',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Config.',
          ),
        ],
      ),
    );
  }
}
