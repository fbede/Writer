import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

@Collection()
class AppUser {
  @Name('UserId')
  final appUserId = Isar.autoIncrement;

  @Name('User Settings')
  final appUserSettings = IsarLink<AppSettings>();
}

@Collection()
class AppSettings {
  int? settingsId = Isar.autoIncrement;

  //@ThemeModeConverter()
  @Name('ThemeMode')
  late ThemeMode? themeModeSettings;
}
