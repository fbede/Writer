import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class ThemeModeConverter extends TypeConverter<ThemeMode, int> {
  const ThemeModeConverter();

  @override
  ThemeMode fromIsar(int themeModeIndex) {
    switch (themeModeIndex) {
      case 0:
        return ThemeMode.dark;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  @override
  int toIsar(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return 0;
      case ThemeMode.light:
        return 1;
      case ThemeMode.system:
        return 2;
    }
  }
}
