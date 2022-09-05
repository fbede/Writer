import 'package:flutter/material.dart';

import 'color_schemes.dart';

final lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    listTileTheme:
        ListTileThemeData(selectedColor: lightColorScheme.secondary));

final darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.surface,
        foregroundColor: darkColorScheme.onSurface),
    listTileTheme: ListTileThemeData(selectedColor: darkColorScheme.secondary));
