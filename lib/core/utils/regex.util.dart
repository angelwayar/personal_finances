final regexEmailStrturcture = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
final regexPasswordStructure = RegExp(
  r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:<>?~-]).{6,}$',
);
