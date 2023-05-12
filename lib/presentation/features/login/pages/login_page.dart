import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_event.dart';
import 'package:wasabi_crossplatform/data/repositories/auth/api_login_repository.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/repositories/auth/abstract_login_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_event.dart';
import 'package:wasabi_crossplatform/presentation/features/login/widgets/email_text_field.dart';
import 'package:wasabi_crossplatform/presentation/features/login/widgets/password_text_field.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/pages/registration_page.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/tasks_list.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/pages/tasks_page.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class LoginPage extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  static const String navigationPath = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

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
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    context.locale.app.appName,
                    style: TextStyle(
                        color: AppColors.lightColorSchemeSeed,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Form(
                    key: widget._formKey,
                    child: Column(
                      children: [
                        EmailTextField(
                            onEmailFieldTextChanged: _onEmailFieldTextChanged),
                        const SizedBox(
                          height: 24,
                        ),
                        PasswordTextField(
                            onPasswordFieldTextChanged:
                                _onPasswordFieldTextChanged),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.locale.auth.isRegistration,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            context.locale.auth.isRegistrationDescription,
                            style: TextStyle(
                              color: AppColors.lightColorSchemeSeed,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RegistrationPage.navigationPath,
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState!.validate()) {
                        widget._formKey.currentState!.save();
                        setState(() {
                          isLoading = true;
                        });
                        context.read<LoginBloc>().add(SendDataEvent());
                        Future.delayed(const Duration(seconds: 1), () async {
                          if (await Datastore.isTokenPresent()) {
                            Future.delayed(const Duration(seconds: 0))
                                .then((value) => {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              TasksPage.navigationPath,
                                              (Route<dynamic> route) => false),
                                    });
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: BorderSide(
                          width: 1.0,
                          color:
                              AppColors.lightColorSchemeSeed.withOpacity(0.8)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      backgroundColor:
                          AppColors.lightColorSchemeSeed.withOpacity(0.8),
                      foregroundColor: AppColors.lightColorSchemeSeed,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.locale.intro.loginBtnText,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: isLoading == false
                              ? const Icon(
                                  Icons.login_rounded,
                                  color: Colors.white,
                                )
                              : const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onEmailFieldTextChanged(String text) {
    var emailChangedEvent = EmailChangedEvent(email: text);
    context.read<LoginBloc>().add(emailChangedEvent);
  }

  void _onPasswordFieldTextChanged(String text) {
    var passwordChangedEvent = PasswordChangedEvent(password: text);
    context.read<LoginBloc>().add(passwordChangedEvent);
  }
}
