import 'package:wasabi_crossplatform/utils/locals/locale_base.dart';

class LocaleRu implements LocaleBase {
  const LocaleRu();

  @override
  AppLocaleBase get app => AppLocalRu();

  @override
  IntroLocaleBase get intro => IntroLocalRu();

  @override
  ErrorLocaleBase get error => ErrorLocalRu();

  @override
  NotFoundLocaleBase get notFound => NotFoundLocalRu();

  @override
  AuthLocaleBase get auth => AuthLocalRu();

  @override
  TasksLocaleBase get tasks => TasksLocalRu();

  @override
  CommonLocaleBase get common => CommonLocalRu();

  @override
  SavedLocaleBase get saved => SavedLocalRu();

  @override
  FavouritesLocaleBase get favourites => FavouritesLocalRu();

  @override
  SettingsLocaleBase get settings => SettingsLocalRu();
}

class AppLocalRu implements AppLocaleBase {
  @override
  String get appName => 'Моя химия';
}

class IntroLocalRu implements IntroLocaleBase {
  @override
  String get description1 =>
      'Приложение предназначено для генерации случайных термохимических условий';

  @override
  String get description2 =>
      'Здесь можно генерировать случайные задачи и сохранять их в избранное';

  @override
  String get description3 =>
      'Чтобы использовать наше приложение, нужно пройти регистрацию или войти в аккаунт';

  @override
  String get loginBtnText => 'Войти в аккаунт';

  @override
  String get regBtnText => 'Зарегистрироваться';

  @override
  String get title1 => 'О чём?';

  @override
  String get title2 => 'Для чего?';

  @override
  String get title3 => 'Что дальше?';
}

class ErrorLocalRu implements ErrorLocaleBase {
  @override
  String get error => 'Ошибка';

  @override
  String get unknown => 'Неизвестно';
}

class NotFoundLocalRu implements NotFoundLocaleBase {
  @override
  String get notFound => 'Не найдено';
}

class AuthLocalRu implements AuthLocaleBase {
  @override
  String get email => 'Введите email';

  @override
  String get isLogin => 'Уже есть аккаунт?';

  @override
  String get isRegistration => 'Нет аккаунта?';

  @override
  String get name => 'Введите имя';

  @override
  String get password => 'Введите пароль';
}

class TasksLocalRu implements TasksLocaleBase {
  @override
  String get title => 'Задачи';
}

class CommonLocalRu implements CommonLocaleBase {
  @override
  String get empty => 'Пусто';

  @override
  String get error => 'Ошибка';
}

class SavedLocalRu implements SavedLocaleBase {
  @override
  String get title => 'Сохранённые';
}

class FavouritesLocalRu implements FavouritesLocaleBase {
  @override
  String get title => 'Избранное';
}

class SettingsLocalRu implements SettingsLocaleBase {
  @override
  String get title => 'Настройки';
}