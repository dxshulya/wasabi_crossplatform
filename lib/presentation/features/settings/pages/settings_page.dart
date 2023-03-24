import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/login/pages/login_page.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_event.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_state.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String navigationPath = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    context.read<SettingsBloc>().add(LoadEmailEvent());
    context.read<SettingsBloc>().add(LoadNameEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.settings.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SettingsBloc, SettingsState>(
              buildWhen: (oldState, newState) =>
                  oldState.themeMode != newState.themeMode,
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        left: 24.0, right: 24.0, bottom: 4.0),
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0, color: AppColors.lightColorSchemeSeed),
                      ),
                    ),
                    child: Text(
                      context.locale.settings.theme,
                      style: TextStyle(
                          color: AppColors.lightColorSchemeSeed, fontSize: 18),
                    ),
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text(context.locale.settings.darkThemeMode),
                    value: ThemeMode.dark,
                    groupValue: state.themeMode,
                    onChanged: _onThemeModeChanged,
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text(context.locale.settings.lightThemeMode),
                    value: ThemeMode.light,
                    groupValue: state.themeMode,
                    onChanged: _onThemeModeChanged,
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text(context.locale.settings.systemThemeMode),
                    value: ThemeMode.system,
                    groupValue: state.themeMode,
                    onChanged: _onThemeModeChanged,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                  left: 24.0, right: 24.0, bottom: 4.0, top: 8.0),
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1.0, color: AppColors.lightColorSchemeSeed),
                ),
              ),
              child: Text(
                context.locale.settings.language,
                style: TextStyle(
                    color: AppColors.lightColorSchemeSeed, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
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
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                  left: 24.0, right: 24.0, bottom: 4.0, top: 8.0),
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1.0, color: AppColors.lightColorSchemeSeed),
                ),
              ),
              child: Text(
                context.locale.settings.user,
                style: TextStyle(
                    color: AppColors.lightColorSchemeSeed, fontSize: 18),
              ),
            ),
            Container(
              // alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                  left: 24.0, right: 24.0, bottom: 4.0, top: 8.0),
              padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        context.locale.settings.email,
                        textAlign: TextAlign.start,
                      ),
                      BlocBuilder<SettingsBloc, SettingsState>(
                          buildWhen: (oldState, newState) =>
                              oldState.email != newState.email,
                          builder: (_, state) {
                            return Text(
                              state.email,
                              style: TextStyle(
                                  color: AppColors.lightColorSchemeSeed,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        context.locale.settings.name,
                        textAlign: TextAlign.start,
                      ),
                      BlocBuilder<SettingsBloc, SettingsState>(
                          buildWhen: (oldState, newState) =>
                              oldState.name != newState.name,
                          builder: (_, state) {
                            return Text(
                              state.name,
                              style: TextStyle(
                                  color: AppColors.lightColorSchemeSeed,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        side: BorderSide(
                            width: 1.0, color: AppColors.lightColorSchemeSeed),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.lightColorSchemeSeed,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.logout_rounded),
                          ),
                          Text(context.locale.settings.logOut),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onThemeModeChanged(ThemeMode? value) {
    context
        .read<SettingsBloc>()
        .add(ChangeThemeModeEvent(value ?? ThemeMode.system));
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(context.locale.settings.no),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(context.locale.settings.yes),
      onPressed: () {
        context.read<SettingsBloc>().add(ClearStorageEvent());
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPage.navigationPath, (Route<dynamic> route) => false);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(context.locale.settings.logOut),
      content: Text(context.locale.settings.exitText),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
