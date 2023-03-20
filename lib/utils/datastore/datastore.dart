import 'package:shared_preferences/shared_preferences.dart';

class Datastore {
  /// Keys
  static const String _userIsFirstLaunch = "USER_IS_FIRST_LAUNCH";
  static const String _userEmail = "USER_EMAIL";
  static const String _userName = "USER_NAME";
  static const String _userPassword = "USER_PASSWORD";
  static const String _userToken = "USER_TOKEN";

  /// Setting the data to Shared Preferences
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

  /// Getting the data from Shared Preferences
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
    return sharedPreferences.getBool(_userIsFirstLaunch);
  }



  static Future<bool> isTokenPresent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userToken);
  }

  static Future<bool> isFirstLaunchPresent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userIsFirstLaunch);
  }
}
