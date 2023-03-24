import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/models/base_user.dart';
import 'package:wasabi_crossplatform/domain/repositories/auth/abstract_registration_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/bloc/registration_event.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/bloc/registration_state.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AbstractRegistrationRepository _repository;

  RegistrationBloc({
    required AbstractRegistrationRepository repository,
  })  : _repository = repository,
        super(const RegistrationState(email: '', name: '', password: '')) {
    on<SendDataEvent>(_onSendData);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<NameChangedEvent>(_onNameChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
  }

  FutureOr<void> _onSendData(
      SendDataEvent event, Emitter<RegistrationState> emit) async {
    emit(
      state.copyWith(
        response: _repository.registration(BaseUser(
            email: state.email, name: state.name, password: state.password)),
      ),
    );
  }

  FutureOr<void> _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<RegistrationState> emit,
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
    Emitter<RegistrationState> emit,
  ) {
    Datastore.setUserName(event.name);
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  FutureOr<void> _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<RegistrationState> emit,
  ) {
    Datastore.setUserPassword(event.password);
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }
}
