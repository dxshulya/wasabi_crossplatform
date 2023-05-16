import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_event.dart';
import 'package:wasabi_crossplatform/data/repositories/auth/api_login_repository.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/repositories/auth/abstract_login_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String navigationPath = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorBloc>(
      lazy: false,
      create: (context) => ErrorBloc(context: context),
      child: RepositoryProvider<AbstractLoginRepository>(
        lazy: false,
        create: (context) => ApiLoginRepository(
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
        child: BlocProvider<LoginBloc>(
          lazy: false,
          create: (context) => LoginBloc(
            repository: context.read<AbstractLoginRepository>(),
          ),
          child: LoginForm(),
        ),
      ),
    );
  }
}
