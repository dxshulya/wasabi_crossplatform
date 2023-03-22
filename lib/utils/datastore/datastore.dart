import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasabi_crossplatform/utils/keys.dart';

class Datastore {
  /// Ключи
  static const String _userIsFirstLaunch = "USER_IS_FIRST_LAUNCH";
  static const String _userEmail = "USER_EMAIL";
  static const String _userName = "USER_NAME";
  static const String _userPassword = "USER_PASSWORD";
  static const String _userToken = "USER_TOKEN";
  static const String _userIsRuLocale = "USER_IS_RU_LOCALE";
  static const String _userDarkMode = "USER_DARK_MODE";

  /// Сохранение данных в Shared Preferences
  static Future<bool> setUserEmail(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_userEmail, email);
  }

  static Future<bool> setUserName(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_userName, name);
  }

  static Future<bool> setUserPassword(String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_userPassword, password);
  }

  static Future<bool> setUserToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_userToken, token);
  }

  static Future<bool> setUserIsFirstLaunch(bool isFirstLaunch) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(_userIsFirstLaunch, isFirstLaunch);
  }

  static Future<bool> setUserIsRuLocale(bool isRuLocale) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(_userIsRuLocale, isRuLocale);
  }

  static Future<bool> setUserThemeMode(String mode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_userDarkMode, mode);
  }

  /// Забрать данные из Shared Preferences
  static Future<String?> getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_userEmail);
  }

  static Future<String?> getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_userName);
  }

  static Future<String?> getUserPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_userPassword);
  }

  static Future<String?> getUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_userToken);
  }

  static Future<bool?> getUserIsFirstLaunch() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(Keys.userIsFirstLaunch);
  }

  static Future<bool?> getUserIsRuLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_userIsRuLocale);
  }

  static Future<String?> getUserThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_userDarkMode);
  }

  ///Проверки данных
  static Future<bool> isTokenPresent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(Keys.userToken);
  }

  static Future<bool> isFirstLaunchPresent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(Keys.userIsFirstLaunch);
  }

  static Future<bool> isRuLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(Keys.userIsRuLocale);
  }

  ///Удалить данные
  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userToken);
  }

  static Future<void> removeEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userEmail);
  }

  static Future<void> removeName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userName);
  }

  static Future<void> removePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userPassword);
  }
}
