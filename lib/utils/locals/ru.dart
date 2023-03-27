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

  @override
  ValidationLocaleBase get validation => ValidationLocalRu();
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
  String get name => 'Как вас зовут?';

  @override
  String get password => 'Введите пароль';

  @override
  String get isLoginDescription => 'Войти';

  @override
  String get isRegistrationDescription => 'Создать';
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

  @override
  String get local => 'Локально';

  @override
  String get remote => 'Удалённо';
}

class SettingsLocalRu implements SettingsLocaleBase {
  @override
  String get title => 'Настройки';

  @override
  String get darkThemeMode => 'Тёмная тема';

  @override
  String get email => 'Почта: ';

  @override
  String get lightThemeMode => 'Светлая тема';

  @override
  String get name => 'Имя: ';

  @override
  String get switchLanguage => 'Сменить язык';

  @override
  String get systemThemeMode => 'Системная тема';

  @override
  String get language => 'Язык';

  @override
  String get theme => 'Тема';

  @override
  String get user => 'Пользователь';

  @override
  String get logOut => 'Выйти из аккаунта';

  @override
  String get exitText => 'Вы действительно хотите выйти из аккаунта';

  @override
  String get no => 'Нет';

  @override
  String get yes => 'Да';
}

class ValidationLocalRu implements ValidationLocaleBase {
  @override
  String get emailPattern => 'Некорректный адрес!';

  @override
  String get emptyPattern => 'Пустое поле!';

  @override
  String get maxSymbolsPattern => 'Максимум 50 символов!';

  @override
  String get minSymbolsPattern => 'Минимум 7 символов!';
}
