import 'package:wasabi_crossplatform/utils/locals/locale_base.dart';

class LocaleEn implements LocaleBase {
  const LocaleEn();

  @override
  AppLocaleBase get app => AppLocalEn();

  @override
  IntroLocaleBase get intro => IntroLocalEn();

  @override
  ErrorLocaleBase get error => ErrorLocalEn();

  @override
  NotFoundLocaleBase get notFound => NotFoundLocalEn();

  @override
  AuthLocaleBase get auth => AuthLocalEn();

  @override
  TasksLocaleBase get tasks => TasksLocalEn();

  @override
  CommonLocaleBase get common => CommonLocalEn();

  @override
  SavedLocaleBase get saved => SavedLocalEn();

  @override
  FavouritesLocaleBase get favourites => FavouritesLocalEn();

  @override
  SettingsLocaleBase get settings => SettingsLocalEn();

  @override
  ValidationLocaleBase get validation => ValidationLocalEn();

  @override
  FiltersLocaleBase get filters => FiltersLocalEn();
}

class AppLocalEn implements AppLocaleBase {
  @override
  String get appName => 'Wasabi';
}

class IntroLocalEn implements IntroLocaleBase {
  @override
  String get description1 =>
      'The application is designed to generate random thermochemical conditions';

  @override
  String get description2 =>
      'Here you can generate random tasks and save them to favorites';

  @override
  String get description3 =>
      'To use our app, you need to register or log in to your account';

  @override
  String get loginBtnText => 'Log in to your account';

  @override
  String get regBtnText => 'Sign up';

  @override
  String get title1 => 'About what?';

  @override
  String get title2 => 'For what?';

  @override
  String get title3 => 'What is next?';
}

class ErrorLocalEn implements ErrorLocaleBase {
  @override
  String get error => 'Error';

  @override
  String get unknown => 'Unknown';
}

class NotFoundLocalEn implements NotFoundLocaleBase {
  @override
  String get notFound => 'Not Found';
}

class AuthLocalEn implements AuthLocaleBase {
  @override
  String get email => 'Enter email';

  @override
  String get isLogin => 'Already have an account?';

  @override
  String get isRegistration => 'No account?';

  @override
  String get name => 'Enter name';

  @override
  String get password => 'Enter password';

  @override
  String get isLoginDescription => 'Log in';

  @override
  String get isRegistrationDescription => 'Create';
}

class TasksLocalEn implements TasksLocaleBase {
  @override
  String get title => 'Tasks';

  @override
  String get answer => 'Answer:';
}

class CommonLocalEn implements CommonLocaleBase {
  @override
  String get empty => 'Empty';

  @override
  String get error => 'Error';
}

class SavedLocalEn implements SavedLocaleBase {
  @override
  String get title => 'Saved';
}

class FavouritesLocalEn implements FavouritesLocaleBase {
  @override
  String get title => 'Favourites';

  @override
  String get local => 'Local';

  @override
  String get remote => 'Remote';
}

class SettingsLocalEn implements SettingsLocaleBase {
  @override
  String get title => 'Settings';

  @override
  String get darkThemeMode => 'Dark Theme Mode';

  @override
  String get email => 'Email: ';

  @override
  String get lightThemeMode => 'Light Theme Mode';

  @override
  String get name => 'Name: ';

  @override
  String get switchLanguage => 'Switch Language';

  @override
  String get systemThemeMode => 'System Theme Mode';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get user => 'User';

  @override
  String get logOut => 'Log Out';

  @override
  String get exitText => 'Do you really want to log out?';

  @override
  String get no => 'No';

  @override
  String get yes => 'Yes';
}

class ValidationLocalEn implements ValidationLocaleBase {
  @override
  String get emailPattern => 'Invalid address!';

  @override
  String get emptyPattern => 'An empty field!';

  @override
  String get maxSymbolsPattern => 'Maximum of 50 characters!';

  @override
  String get minSymbolsPattern => 'Minimum of 7 characters!';
}

class FiltersLocalEn implements FiltersLocaleBase {
  @override
  String get apply => 'Apply';

  @override
  String get byTask => 'By task';

  @override
  String get reset => 'Reset';

  @override
  String get byType => 'By type';

  @override
  String get title => 'Filters';

}
