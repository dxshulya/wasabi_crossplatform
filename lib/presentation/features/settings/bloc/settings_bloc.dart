import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasabi_crossplatform/blocs/locale_bloc/locale_bloc.dart';
import 'package:wasabi_crossplatform/blocs/locale_bloc/locale_event.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_event.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/bloc/settings_state.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';
import 'package:wasabi_crossplatform/utils/keys.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';
import 'package:wasabi_crossplatform/utils/theme_mode_ext.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final LocaleBloc _localeBloc;
  final FavouritesBloc _favouritesBloc;

  SettingsBloc(LocaleBloc localeBloc, FavouritesBloc favouritesBloc)
      : _localeBloc = localeBloc,
        _favouritesBloc = favouritesBloc,
        super(const SettingsState(
            email: '',
            name: '',
            isRuLocale: true,
            themeMode: ThemeMode.system)) {
    on<LoadNameEvent>(_onLoadName);
    on<ClearNameEvent>(_onClearName);
    on<LoadEmailEvent>(_onLoadEmail);
    on<ClearEmailEvent>(_onClearEmail);
    on<UpdateLocaleEvent>(_onUpdateLocale);
    on<LoadSettingsEvent>(_onLoadSettings);
    on<ChangeThemeModeEvent>(_onThemeModeChanged);
    on<ClearStorageEvent>(_onClearStorage);
  }

  void _onLoadName(LoadNameEvent event, Emitter<SettingsState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();
    final String? name = sharedPreference.getString(Keys.userName);
    emit(state.copyWith(name: name));
  }

  void _onClearName(ClearNameEvent event, Emitter<SettingsState> emit) async {
    final shapedPreference = await SharedPreferences.getInstance();
    await shapedPreference.remove(Keys.userName);
    emit(state.copyWith(name: ''));
  }

  void _onLoadEmail(LoadEmailEvent event, Emitter<SettingsState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();
    final String? email = sharedPreference.getString(Keys.userEmail);
    emit(state.copyWith(email: email));
  }

  void _onClearEmail(ClearEmailEvent event, Emitter<SettingsState> emit) async {
    final shapedPreference = await SharedPreferences.getInstance();
    await shapedPreference.remove(Keys.userEmail);
    emit(state.copyWith(email: ''));
  }

  void _onUpdateLocale(
      UpdateLocaleEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(isRuLocale: event.value));
    _localeBloc.add(ChangeLocaleEvent(!event.value
        ? availableLocales[ruLocale]!
        : availableLocales[enLocale]!));
    Datastore.setUserIsRuLocale(event.value);
  }

  void init() {
    add(LoadSettingsEvent());
  }

  void _onLoadSettings(
      LoadSettingsEvent event, Emitter<SettingsState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();
    var isRuLocale = sharedPreference.getBool(Keys.userIsRuLocale) ?? false;
    var currentThemeMode =
        sharedPreference.getString(Keys.userThemeMode)?.asThemeMode() ??
            ThemeMode.system;

    emit(state.copyWith(isRuLocale: isRuLocale, themeMode: currentThemeMode));
    _localeBloc.add(ChangeLocaleEvent(!isRuLocale
        ? availableLocales[ruLocale]!
        : availableLocales[enLocale]!));
  }

  void _onThemeModeChanged(
      ChangeThemeModeEvent event, Emitter<SettingsState> emit) async {
    if (event.mode != state.themeMode) {
      Datastore.setUserThemeMode(event.mode.toString());
      emit(state.copyWith(themeMode: event.mode));
    }
  }

  void _onClearStorage(
      ClearStorageEvent event, Emitter<SettingsState> emit) async {
    Datastore.removeEmail();
    Datastore.removeName();
    Datastore.removePassword();
    Datastore.removeToken();
    _favouritesBloc.add(ClearFavourites());
    emit(state.copyWith(
      email: '',
      name: '',
    ));
  }
}
