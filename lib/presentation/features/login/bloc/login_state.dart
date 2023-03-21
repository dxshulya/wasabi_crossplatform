import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_login_response.dart';

class LoginState extends Equatable {
  final Future<AbstractLogin>? data;

  const LoginState({this.data});

  LoginState copyWith({
    Future<AbstractLogin>? data,
    int? page,
  }) =>
      LoginState(
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [data ?? 0];
}