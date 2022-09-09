import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../type_converters/type_converters.dart';

@Collection()
class AppUser {
  @Id()
  @Name('UserId')
  final appUserId = Isar.autoIncrement;

  @Name('User Settings')
  final appUserSettings = IsarLink<AppSettings>();
}

@Collection()
class AppSettings {
  @Id()
  int? settingsId = Isar.autoIncrement;

  @ThemeModeConverter()
  @Name('ThemeMode')
  late ThemeMode? themeModeSettings;
}
