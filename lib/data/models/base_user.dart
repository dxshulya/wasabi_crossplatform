import 'package:wasabi_crossplatform/domain/models/auth/abstract_user.dart';

class BaseUser implements AbstractUser {
  BaseUser({
    required String email,
    required String name,
    required String password,
  })  : _email = email,
        _name = name,
        _password = password;

  BaseUser.empty() : this(email: '', name: '', password: '');

  @override
  String get email => _email;
  final String _email;

  @override
  String get name => _name;
  final String _name;

  @override
  String get password => _password;
  final String _password;
}
