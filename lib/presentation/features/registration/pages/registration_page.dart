import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/login/pages/login_page.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/bloc/registration_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/bloc/registration_event.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/widgets/email_text_field.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/widgets/name_text_field.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/widgets/password_text_field.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/pages/tasks_page.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class RegistrationPage extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  RegistrationPage({Key? key}) : super(key: key);

  static const String navigationPath = '/registration';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isLoading = false;

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
            Form(
              key: widget._formKey,
              child: Column(
                children: [
                  NameTextField(
                      onNameFieldTextChanged: _onNameFieldTextChanged),
                  const SizedBox(
                    height: 24,
                  ),
                  EmailTextField(
                      onEmailFieldTextChanged: _onEmailFieldTextChanged),
                  const SizedBox(
                    height: 24,
                  ),
                  PasswordTextField(
                      onPasswordFieldTextChanged: _onPasswordFieldTextChanged),
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
                  context.locale.auth.isLogin,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context.locale.auth.isLoginDescription,
                      style: TextStyle(
                        color: AppColors.lightColorSchemeSeed,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginPage.navigationPath,
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
                    context.read<RegistrationBloc>().add(SendDataEvent());
                    Future.delayed(const Duration(seconds: 1), () async {
                      if (await Datastore.isTokenPresent()) {
                        Future.delayed(const Duration(seconds: 0))
                            .then((value) => {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
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
                      context.locale.intro.regBtnText,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: isLoading == false
                          ? const Icon(
                              Icons.account_box_rounded,
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
                )),
          ],
        ),
      ),
    );
  }

  void _onEmailFieldTextChanged(String text) {
    var emailChangedEvent = EmailChangedEvent(email: text);
    context.read<RegistrationBloc>().add(emailChangedEvent);
  }

  void _onNameFieldTextChanged(String text) {
    var nameChangedEvent = NameChangedEvent(name: text);
    context.read<RegistrationBloc>().add(nameChangedEvent);
  }

  void _onPasswordFieldTextChanged(String text) {
    var passwordChangedEvent = PasswordChangedEvent(password: text);
    context.read<RegistrationBloc>().add(passwordChangedEvent);
  }
}
