enum NamePage {
  splash,
  login,
  home,
  accountRegister,
  errorPopup;

  String path() {
    switch (this) {
      case NamePage.splash:
        return '/splash';
      case NamePage.login:
        return '/login';
      case NamePage.home:
        return '/home';
      case NamePage.accountRegister:
        return '/account-register';
      case NamePage.errorPopup:
        return '/error-popup';
    }
  }
}
