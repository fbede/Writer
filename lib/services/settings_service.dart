import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../type_converters/type_converters.dart';

class SettingsService {
  late final SharedPreferences _prefs;
  static bool _isInitialized = false;
  static final SettingsService _instance = SettingsService._();

  factory SettingsService({required SharedPreferences preferences}) {
    if (_isInitialized) {
      return _instance;
    } else {
      _instance._prefs = preferences;
      _isInitialized = true;
      return _instance;
    }
  }

  SettingsService._();

  /*
  List of Settings
  1. ThemeMode
  */

  //ThemeMode Settings
  void changeThemeMode(ThemeMode themeMode) async {
    await _prefs.setInt('themeMode', themeModeToPrefs(themeMode));
  }

  ThemeMode getThemeMode() {
    ThemeMode themeMode = themeModeFromPrefs(_prefs.getInt('themeMode'));
    return themeMode;
  }
}
