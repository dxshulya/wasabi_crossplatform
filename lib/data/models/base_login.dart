import 'package:wasabi_crossplatform/domain/models/auth/abstract_login_response.dart';

class BaseLogin implements AbstractLogin {
  BaseLogin({
    required String token,
    required String login,
  })  : _token = token,
        _login = login;

  BaseLogin.empty() : this(token: '', login: '');

  @override
  String get token => _token;
  final String _token;

  @override
  String get login => _login;
  final String _login;
}
