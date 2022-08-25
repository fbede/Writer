import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  changeThemeMode({required ThemeMode themeMode}) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
