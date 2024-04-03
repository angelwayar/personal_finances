import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finances/pages/statistic/statistics.page.dart';

import '../../pages/financialRegister/financial.page.dart';
import '../../pages/home/home.page.dart';
import '../../pages/register/register_account.page.dart';
import 'enum/name_page.enum.dart';
import 'scaffold_with_nested_navigation.dart';

class AppRoutes {
  static final _shellNavigatorAKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorBKey = GlobalKey<NavigatorState>();

  static final routes = [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        RegExp regex = RegExp(r'/.*?/');

        return ScaffoldWithNestedNavigation(
          navigationShell: navigationShell,
          hideNavigationBar: regex.hasMatch(state.fullPath!),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: NamePage.home.path(),
              pageBuilder: (context, state) => const NoTransitionPage(
                child: MyHomePage(),
              ),
              routes: [
                GoRoute(
                  path: NamePage.accountRegister.path(),
                  builder: (context, state) {
                    return const RegisterAccountPage();
                  },
                ),
                GoRoute(
                  path: NamePage.journal.path(),
                  builder: (context, state) {
                    return const FinancialPage();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: '/statistics',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: StattisticsPage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ];
}
