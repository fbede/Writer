import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:writer/ui/settings/cubit/cubit_converters.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required this.prefs}) : super(SettingsInitial(prefs: prefs));
  final SharedPreferences prefs;
  final String stringThemeMode = 'themeMode';
  final intGen = Random();

  changeThemeMode({required ThemeMode themeMode}) async {
    await prefs.setInt(stringThemeMode, themeModeToPrefs(themeMode));
    emit(state.copyWith(themeMode: themeMode, randomInt: intGen.nextInt(999)));
  }

  getThemeMode() {
    ThemeMode themeMode = themeModeFromPrefs(prefs.getInt(stringThemeMode));
    emit(state.copyWith(themeMode: themeMode));
  }
}
