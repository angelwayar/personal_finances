import 'package:go_router/go_router.dart';

import '../../pages/home/home.page.dart';
import '../../pages/register/register_account.page.dart';
import 'enum/name_page.enum.dart';

class AppRoutes {
  static final routes = [
    GoRoute(
      path: NamePage.home.path(),
      builder: (context, state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: NamePage.accountRegister.path(),
      builder: (context, state) {
        return const RegisterAccountPage();
      },
    ),
  ];
}
