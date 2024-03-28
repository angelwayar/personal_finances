import 'package:go_router/go_router.dart';
import 'package:personal_finances/core/router/enum/name_page.enum.dart';

import '../../page/home.page.dart';

class AppRoutes {
  static final routes = [
    GoRoute(
      path: NamePage.home.path(),
      builder: (context, state) {
        return const MyHomePage();
      },
    ),
  ];
}
