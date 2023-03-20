abstract class LocaleBase {
  AppLocaleBase get app;

  IntroLocaleBase get intro;

  ErrorLocaleBase get error;

  NotFoundLocaleBase get notFound;

  AuthLocaleBase get auth;

  TasksLocaleBase get tasks;

  CommonLocaleBase get common;

  SavedLocaleBase get saved;

  FavouritesLocaleBase get favourites;

  SettingsLocaleBase get settings;
}

abstract class AppLocaleBase {
  String get appName;
}

abstract class IntroLocaleBase {
  String get title1;

  String get title2;

  String get title3;

  String get description1;

  String get description2;

  String get description3;

  String get loginBtnText;

  String get regBtnText;
}

abstract class ErrorLocaleBase {
  String get error;

  String get unknown;
}

abstract class NotFoundLocaleBase {
  String get notFound;
}

abstract class AuthLocaleBase {
  String get email;

  String get name;

  String get password;

  String get isLogin;

  String get isRegistration;
}

abstract class TasksLocaleBase {
  String get title;
}

abstract class CommonLocaleBase {
  String get empty;

  String get error;
}

abstract class SavedLocaleBase {
  String get title;
}

abstract class FavouritesLocaleBase {
  String get title;
}

abstract class SettingsLocaleBase {
  String get title;
}