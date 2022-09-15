import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:writer/cubits/cubits.dart';
import 'package:writer/services/services.dart';

import '../type_converters/type_converters.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required SharedPreferences prefs,
  })  : _settingsService = SettingsService(preferences: prefs),
        super(
          SettingsInitial(prefs: prefs),
        );

  //final SharedPreferences _prefs;
  final SettingsService _settingsService;

  changeThemeMode({
    required ThemeMode themeMode,
  }) {
    _settingsService.changeThemeMode(themeMode);
    emit(
      state.copyWith(themeMode: themeMode),
    );
  }

  getThemeMode() {
    emit(state.copyWith(
      themeMode: _settingsService.getThemeMode(),
    ));
  }
}
