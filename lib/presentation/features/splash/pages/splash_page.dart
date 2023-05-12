import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasabi_crossplatform/presentation/features/intro/pages/intro_page.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/pages/registration_page.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/tasks_list.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/pages/tasks_page.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';
import 'package:wasabi_crossplatform/utils/strings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String navigationPath = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() async {
    if (await Datastore.isFirstLaunchPresent() == false) {
      Datastore.setUserIsFirstLaunch(false);
      Future.delayed(const Duration(seconds: 2)).then((value) => {
            Navigator.of(context).pushNamedAndRemoveUntil(
                IntroPage.navigationPath, (Route<dynamic> route) => false),
          });
    } else if (await Datastore.isTokenPresent() == false) {
      Future.delayed(const Duration(seconds: 2)).then((value) => {
            Navigator.of(context).pushNamedAndRemoveUntil(
                RegistrationPage.navigationPath,
                (Route<dynamic> route) => false),
          });
    } else {
      Future.delayed(const Duration(seconds: 2)).then((value) => {
            Navigator.of(context).pushNamedAndRemoveUntil(
                TasksPage.navigationPath, (Route<dynamic> route) => false),
          });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColorSchemeSeed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 16),
            child: SvgPicture.asset(AppStrings.logoPlaceHolder),
          ),
          Text(
            context.locale.app.appName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
