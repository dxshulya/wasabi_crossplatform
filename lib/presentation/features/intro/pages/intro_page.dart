import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasabi_crossplatform/presentation/features/login/pages/login_page.dart';
import 'package:wasabi_crossplatform/presentation/features/login/widgets/login_form.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/pages/registration_page.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_event.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_state.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';
import 'package:wasabi_crossplatform/utils/strings.dart';

///добавить анимации
class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const String navigationPath = '/intro';

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: PageView(
        controller: controller,
        children: <Widget>[
          ///Первая страница
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.blue])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      BlocBuilder<SettingsBloc, SettingsState>(
                        builder: (context, state) => Checkbox(
                          value: state.isRuLocale,
                          onChanged: (val) {
                            final isRuLocale = val ?? false;
                            context
                                .read<SettingsBloc>()
                                .add(UpdateLocaleEvent(value: isRuLocale));
                          },
                        ),
                      ),
                      Flexible(
                        child: Text(context.locale.settings.switchLanguage),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppStrings.logo2PlaceHolder,
                    width: 300,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          context.locale.intro.title1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        context.locale.intro.description1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        side: const BorderSide(width: 1.0, color: Colors.white),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.lightColorSchemeSeed,
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          ///Вторая странциа
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.indigo, Colors.blue])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppStrings.logo2PlaceHolder,
                    width: 300,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          context.locale.intro.title2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        context.locale.intro.description2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        side: const BorderSide(width: 1.0, color: Colors.white),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.lightColorSchemeSeed,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        side: const BorderSide(width: 1.0, color: Colors.white),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.lightColorSchemeSeed,
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          ///Третья страница
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.blue])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppStrings.logo2PlaceHolder,
                    width: 300,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          context.locale.intro.title3,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        context.locale.intro.description3,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RegistrationPage.navigationPath,
                              (Route<dynamic> route) => false);
                        },
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          side:
                              const BorderSide(width: 1.0, color: Colors.white),
                          foregroundColor: AppColors.lightColorSchemeSeed,
                        ),
                        child: Text(
                          context.locale.intro.regBtnText,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginPage.navigationPath,
                              (Route<dynamic> route) => false);
                        },
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          side:
                              const BorderSide(width: 1.0, color: Colors.white),
                          foregroundColor: AppColors.lightColorSchemeSeed,
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          context.locale.intro.loginBtnText,
                          style: TextStyle(
                            color: AppColors.lightColorSchemeSeed,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
