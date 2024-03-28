import 'package:go_router/go_router.dart';

import '../../pages/home.page.dart';
import 'enum/name_page.enum.dart';

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
