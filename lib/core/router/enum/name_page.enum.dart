enum NamePage {
  splash('/splash'),
  login('/login'),
  home('/home'),
  journal('journal'),
  accountRegister('account-register'),
  errorPopup('/error-popup');

  const NamePage(this.path);
  final String path;
}
