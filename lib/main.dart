import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wasabi_crossplatform/blocs/locale_bloc/locale_bloc.dart';
import 'package:wasabi_crossplatform/blocs/locale_bloc/locale_state.dart';
import 'package:wasabi_crossplatform/data/repositories/favourites_tasks_repositories.dart';
import 'package:wasabi_crossplatform/domain/repositories/abstract_favourites_tasks_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/pages/favourites_page.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/bloc/filters_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/intro/pages/intro_page.dart';
import 'package:wasabi_crossplatform/presentation/features/login/pages/login_page.dart';
import 'package:wasabi_crossplatform/presentation/features/not_found/pages/not_found_page.dart';
import 'package:wasabi_crossplatform/presentation/features/registration/pages/registration_page.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/pages/saved_page.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_state.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/pages/settings_page.dart';
import 'package:wasabi_crossplatform/presentation/features/splash/pages/splash_page.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/pages/tasks_page.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';
import 'package:wasabi_crossplatform/utils/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AbstractFavouritesTasksRepository>(
      lazy: false,
      create: (_) => FavouritesTasksRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LocaleBloc>(
            lazy: false,
            create: (_) => LocaleBloc(),
          ),
          BlocProvider<FavouritesBloc>(
            lazy: false,
            create: (context) => FavouritesBloc(
              repository: context.read<AbstractFavouritesTasksRepository>(),
            ),
          ),
          BlocProvider<SettingsBloc>(
            lazy: false,
            create: (context) => SettingsBloc(
                context.read<LocaleBloc>(), context.read<FavouritesBloc>())
              ..init(),
          ),
          BlocProvider<FiltersBloc>(
            lazy: false,
            create: (_) => FiltersBloc(),
          ),
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, state) => MaterialApp(
                locale: state.locale,
                localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                  GlobalWidgetsLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  MyLocalizationsDelegate(initialLocals),
                ],
                supportedLocales: availableLocales.values,
                onGenerateTitle: (BuildContext context) =>
                    context.locale.app.appName,
                themeMode: context.read<SettingsBloc>().state.themeMode,
                theme: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: AppColors.lightColorSchemeSeed,
                  brightness: Brightness.light,
                  fontFamily: AppStrings.fontFamily,
                ),
                darkTheme: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: AppColors.lightColorSchemeSeed,
                  brightness: Brightness.dark,
                  fontFamily: AppStrings.fontFamily,
                ),
                initialRoute: SplashPage.navigationPath,
                onGenerateRoute: (RouteSettings settings) {
                  if (settings.name == SplashPage.navigationPath) {
                    return MaterialPageRoute(
                      builder: (_) {
                        return const SplashPage();
                      },
                    );
                  }

                  if (settings.name == LoginPage.navigationPath) {
                    return MaterialPageRoute(
                      builder: (_) {
                        return const LoginPage();
                      },
                    );
                  }

                  if (settings.name == RegistrationPage.navigationPath) {
                    return MaterialPageRoute(
                      builder: (_) {
                        return const RegistrationPage();
                      },
                    );
                  }

                  if (settings.name == IntroPage.navigationPath) {
                    return MaterialPageRoute(
                      builder: (_) {
                        return const IntroPage();
                      },
                    );
                  }

                  if (settings.name == TasksPage.navigationPath) {
                    return MaterialPageRoute(
                      builder: (_) {
                        return const TasksPage();
                      },
                    );
                  }

                  if (settings.name == SavedPage.navigationPath) {
                    return MaterialPageRoute(
                      builder: (_) {
                        return const SavedPage();
                      },
                    );
                  }

                  if (settings.name == FavouritesPage.navigationPath) {
                    return MaterialPageRoute(
                      builder: (_) {
                        return const FavouritesPage();
                      },
                    );
                  }

                  if (settings.name == SettingsPage.navigationPath) {
                    return MaterialPageRoute(
                      builder: (_) {
                        return const SettingsPage();
                      },
                    );
                  }

                  return MaterialPageRoute(
                    builder: (_) => const NotFoundPage(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
