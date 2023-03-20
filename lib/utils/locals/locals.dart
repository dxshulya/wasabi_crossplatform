import 'dart:async' show Future;

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart'
    show BuildContext, Locale, Localizations, LocalizationsDelegate;
import 'package:wasabi_crossplatform/utils/locals/en.dart';
import 'package:wasabi_crossplatform/utils/locals/locale_base.dart';
import 'package:wasabi_crossplatform/utils/locals/ru.dart';

const String ruLocale = 'ru_RU';
const String enLocale = 'en_US';

Map<String, LocaleBase> initialLocals = const <String, LocaleBase>{
  ruLocale: LocaleRu(),
  enLocale: LocaleEn(),
};

Map<String, Locale> availableLocales = const <String, Locale>{
  ruLocale: Locale('ru', 'RU'),
  enLocale: Locale('en', 'US'),
};

extension LocalContextExtension on BuildContext {
  LocaleBase get locale => Localizations.of<Locals>(this, Locals)!.current;
}

class Locals {
  Locals(this.locale, this.localizedValues) {
    current = localizedValues[locale.toString()] ?? initialLocals[ruLocale]!;
  }

  final Locale locale;

  final Map<String, LocaleBase> localizedValues;

  late LocaleBase current;
}

class MyLocalizationsDelegate extends LocalizationsDelegate<Locals> {
  Map<String, LocaleBase> localizedValues;

  MyLocalizationsDelegate(this.localizedValues);

  @override
  bool isSupported(Locale locale) =>
      localizedValues.keys.toList().contains(locale.toString());

  @override
  Future<Locals> load(Locale locale) => SynchronousFuture<Locals>(
        Locals(
          isSupported(locale) ? locale : availableLocales[ruLocale]!,
          localizedValues,
        ),
      );

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
