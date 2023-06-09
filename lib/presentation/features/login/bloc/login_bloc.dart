import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/base_user.dart';
import 'package:wasabi_crossplatform/domain/repositories/auth/abstract_login_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_event.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_state.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AbstractLoginRepository _repository;

  LoginBloc({
    required AbstractLoginRepository repository,
  })  : _repository = repository,
        super(const LoginState(email: '', name: '', password: '')) {
    on<SendDataEvent>(_onSendData);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<NameChangedEvent>(_onNameChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
  }

  FutureOr<void> _onSendData(
      SendDataEvent event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
          response: _repository.login(BaseUser(
              email: state.email, name: state.name, password: state.password))),
    );
  }

  FutureOr<void> _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    Datastore.setUserEmail(event.email);
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  FutureOr<void> _onNameChangedEvent(
    NameChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    Datastore.setUserName(event.name);
    state.response?.then((value) => value.login);
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  FutureOr<void> _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    Datastore.setUserPassword(event.password);
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }
}
