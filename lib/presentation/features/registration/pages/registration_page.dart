import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_event.dart';
import 'package:wasabi_crossplatform/data/repositories/auth/api_registration_repository.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/repositories/auth/abstract_registration_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/bloc/registration_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/widgets/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  static const String navigationPath = '/registration';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorBloc>(
      lazy: false,
      create: (context) => ErrorBloc(context: context),
      child: RepositoryProvider<AbstractRegistrationRepository>(
        lazy: false,
        create: (context) => ApiRegistrationRepository(
          apiService: ApiService(
            onErrorHandler: (String code, String message, String error) {
              context.read<ErrorBloc>().add(
                    ShowDialogEvent(
                      title: code,
                      message: message,
                      error: error,
                    ),
                  );
            },
          ),
        ),
        child: BlocProvider<RegistrationBloc>(
          lazy: false,
          create: (context) => RegistrationBloc(
            repository: context.read<AbstractRegistrationRepository>(),
          ),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}
