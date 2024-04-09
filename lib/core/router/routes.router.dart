import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/auth/login.page.dart';
import '../../pages/auth/signup.page.dart';
import '../../pages/financialRegister/financial.page.dart';
import '../../pages/home/home.page.dart';
import '../../pages/register/register_account.page.dart';
import '../../pages/statistic/statistics.page.dart';
import 'enum/name_page.enum.dart';
import 'scaffold_with_nested_navigation.dart';

class AppRoutes {
  static final _shellNavigatorAKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorBKey = GlobalKey<NavigatorState>();

  static final routes = [
    GoRoute(
      path: NamePage.login.path,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: NamePage.signup.path,
      builder: (context, state) => const SignUpPage(),
    ),
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
              path: NamePage.home.path,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: MyHomePage(
                    email: (state.extra as String),
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: NamePage.accountRegister.path,
                  builder: (context, state) {
                    return const RegisterAccountPage();
                  },
                ),
                GoRoute(
                  path: NamePage.journal.path,
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
