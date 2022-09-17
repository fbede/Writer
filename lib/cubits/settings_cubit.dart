import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:writer/services/services.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required SettingsService service,
  })  : _settingsService = service,
        super(
          SettingsInitial(service: service),
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
