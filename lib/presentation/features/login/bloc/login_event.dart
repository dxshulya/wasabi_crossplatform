import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SendDataEvent extends LoginEvent {}

class EmailChangedEvent extends LoginEvent {
  final String email;

  const EmailChangedEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class NameChangedEvent extends LoginEvent {
  final String name;

  const NameChangedEvent({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}

class PasswordChangedEvent extends LoginEvent {
  final String password;

  const PasswordChangedEvent({
    required this.password,
  });

  @override
  List<Object> get props => [password];
}
