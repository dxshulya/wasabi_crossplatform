import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/repositories/auth/abstract_login_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_event.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AbstractLoginRepository _repository;

  LoginBloc({
    required AbstractLoginRepository repository,
  })  : _repository = repository,
        super(const LoginState()) {
    on<LoadDataEvent>(_onLoadData);
  }

  FutureOr<void> _onLoadData(
      LoadDataEvent event, Emitter<LoginState> emit) async {
    // emit(
    //   state.copyWith(
    //     data: _repository.login(),
    //   ),
    // );
  }
}