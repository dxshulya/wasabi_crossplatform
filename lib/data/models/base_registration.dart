import 'package:wasabi_crossplatform/domain/models/auth/abstract_registration_response.dart';

class BaseRegistration implements AbstractRegistration {
  BaseRegistration({
    required String token,
    required String login,
  })  : _token = token,
        _login = login;

  BaseRegistration.empty() : this(token: '', login: '');

  @override
  String get token => _token;
  final String _token;

  @override
  String get login => _login;
  final String _login;
}
