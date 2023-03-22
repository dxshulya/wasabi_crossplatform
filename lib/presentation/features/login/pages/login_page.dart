import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/login/bloc/login_event.dart';
import 'package:wasabi_crossplatform/presentation/features/login/widgets/email_text_field.dart';
import 'package:wasabi_crossplatform/presentation/features/login/widgets/password_text_field.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/pages/registration_page.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/pages/tasks_page.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String navigationPath = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            EmailTextField(
                onEmailFieldTextChanged: _onEmailFieldTextChanged,
                initialText: ''),
            const SizedBox(
              height: 24,
            ),
            PasswordTextField(
                onPasswordFieldTextChanged: _onPasswordFieldTextChanged,
                isShowPassword: true,
                onIsShowPressed: _onIsShowPressed,
                initialText: ''),
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
                onPressed: () async {
                  final bloc = context.read<LoginBloc>();
                  context.read<LoginBloc>().add(SendDataEvent());
                  final response = await bloc.state.response;
                  final String? login = response?.login.toString();
                  final String? token = response?.token.toString();
                  if (token!.isNotEmpty && login!.isNotEmpty) {
                    Future.delayed(const Duration(seconds: 0)).then((value) => {
                          Datastore.setUserName(login),
                          Datastore.setUserToken(token),
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              TasksPage.navigationPath,
                              (Route<dynamic> route) => false),
                        });
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  side: BorderSide(
                      width: 1.0,
                      color: AppColors.lightColorSchemeSeed.withOpacity(0.8)),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.login_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          ],
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

  void _onIsShowPressed(bool isShow) {}
}
