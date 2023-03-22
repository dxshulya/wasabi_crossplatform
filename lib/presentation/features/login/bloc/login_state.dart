import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_login_response.dart';

class LoginState extends Equatable {
  final Future<AbstractLogin>? response;
  final String email;
  final String name;
  final String password;

  const LoginState(
      {this.response,
      required this.email,
      required this.name,
      required this.password});

  LoginState copyWith({
    Future<AbstractLogin>? response,
    String? email,
    String? name,
    String? password,
  }) =>
      LoginState(
        response: response ?? this.response,
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [response ?? 0, email, name, password];
}
