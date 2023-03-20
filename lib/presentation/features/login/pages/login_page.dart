import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/presentation/features/login/widgets/email_text_field.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/pages/registration_page.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/pages/tasks_page.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
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
        padding: const EdgeInsets.all(16.0),
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
              height: 64,
            ),
            const EmailTextField(initialText: ''),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: context.locale.auth.password,
                hintText: context.locale.auth.password,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.locale.auth.isRegistration,
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
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    TasksPage.navigationPath, (Route<dynamic> route) => false);
              },
              child: Text(context.locale.intro.loginBtnText),
            ),
          ],
        ),
      ),
    );
  }

  void _onEmailFieldTextChanged(String text) {
    // var emailChangedEvent = SearchPageChangedEvent(search: text);
    // DelayedAction.run(() {
    //   context.read<SearchPageBloc>().add(searchChangedEvent);
    // });
  }

}
