import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_registration_response.dart';

class RegistrationState extends Equatable {
  final Future<AbstractRegistration>? response;
  final String email;
  final String name;
  final String password;

  const RegistrationState(
      {this.response,
      required this.email,
      required this.name,
      required this.password});

  RegistrationState copyWith({
    Future<AbstractRegistration>? response,
    String? email,
    String? name,
    String? password,
  }) =>
      RegistrationState(
        response: response ?? this.response,
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [response ?? 0, email, name, password];
}
