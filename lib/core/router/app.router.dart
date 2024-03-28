import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'enum/name_page.enum.dart';
import 'routes.router.dart';

class AppRouter {
  static final _routtNavigator = GlobalKey<NavigatorState>();

  static GoRouter get router => _routers;

  static final _routers = GoRouter(
    navigatorKey: _routtNavigator,
    initialLocation: NamePage.home.path(),
    onException: (context, state, router) {
      // TODO: se debe de lanzar un popup en caso de error
    },
    routes: AppRoutes.routes,
  );
}
