import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class SendDataEvent extends RegistrationEvent {}

class EmailChangedEvent extends RegistrationEvent {
  final String email;

  const EmailChangedEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class NameChangedEvent extends RegistrationEvent {
  final String name;

  const NameChangedEvent({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}

class PasswordChangedEvent extends RegistrationEvent {
  final String password;

  const PasswordChangedEvent({
    required this.password,
  });

  @override
  List<Object> get props => [password];
}
