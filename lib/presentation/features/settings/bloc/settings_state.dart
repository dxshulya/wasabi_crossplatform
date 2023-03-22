import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  final String name;
  final String email;

  final bool isRuLocale;
  final ThemeMode themeMode;

  const SettingsState(
      {required this.email,
      required this.name,
      required this.isRuLocale,
      required this.themeMode});

  SettingsState copyWith(
          {String? email,
          String? name,
          bool? isRuLocale,
          ThemeMode? themeMode}) =>
      SettingsState(
        email: email ?? this.email,
        name: name ?? this.name,
        isRuLocale: isRuLocale ?? this.isRuLocale,
        themeMode: themeMode ?? this.themeMode,
      );

  @override
  List<Object> get props => [email, name, isRuLocale, themeMode];
}
