import 'package:flutter/material.dart';

getAppBarBackgroundColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return Theme.of(context).colorScheme.primary;
  } else {
    return Theme.of(context).colorScheme.surface;
  }
}

getAppBarForgroundColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return Theme.of(context).colorScheme.onPrimary;
  } else {
    return Theme.of(context).colorScheme.onSurface;
  }
}

const oldLightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006A6A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF00FBFB),
  onPrimaryContainer: Color(0xFF002020),
  secondary: Color(0xFF6C4DA6),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFEBDCFF),
  onSecondaryContainer: Color(0xFF260059),
  tertiary: Color(0xFF526600),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFC7F314),
  onTertiaryContainer: Color(0xFF171E00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF6FEFF),
  onBackground: Color(0xFF001F24),
  surface: Color(0xFFF6FEFF),
  onSurface: Color(0xFF001F24),
  surfaceVariant: Color(0xFFDAE5E4),
  onSurfaceVariant: Color(0xFF3F4948),
  outline: Color(0xFF6F7979),
  onInverseSurface: Color(0xFFD0F8FF),
  inverseSurface: Color(0xFF00363D),
  inversePrimary: Color(0xFF00DDDD),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006A6A),
);

const oldDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF00DDDD),
  onPrimary: Color(0xFF003737),
  primaryContainer: Color(0xFF004F4F),
  onPrimaryContainer: Color(0xFF00FBFB),
  secondary: Color(0xFFD3BBFF),
  onSecondary: Color(0xFF3C1A74),
  secondaryContainer: Color(0xFF54348C),
  onSecondaryContainer: Color(0xFFEBDCFF),
  tertiary: Color(0xFFAED500),
  onTertiary: Color(0xFF293500),
  tertiaryContainer: Color(0xFF3D4D00),
  onTertiaryContainer: Color(0xFFC7F314),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F24),
  onBackground: Color(0xFF97F0FF),
  surface: Color(0xFF001F24),
  onSurface: Color(0xFF97F0FF),
  surfaceVariant: Color(0xFF3F4948),
  onSurfaceVariant: Color(0xFFBEC9C8),
  outline: Color(0xFF889392),
  onInverseSurface: Color(0xFF001F24),
  inverseSurface: Color(0xFF97F0FF),
  inversePrimary: Color(0xFF006A6A),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF00DDDD),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006A6A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF6FF7F6),
  onPrimaryContainer: Color(0xFF002020),
  secondary: Color(0xFF7F5700),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDEAD),
  onSecondaryContainer: Color(0xFF281900),
  tertiary: Color(0xFF046D37),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF9CF6B1),
  onTertiaryContainer: Color(0xFF00210C),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFCFF),
  onBackground: Color(0xFF001F2A),
  surface: Color(0xFFFAFCFF),
  onSurface: Color(0xFF001F2A),
  surfaceVariant: Color(0xFFDAE5E4),
  onSurfaceVariant: Color(0xFF3F4948),
  outline: Color(0xFF6F7979),
  onInverseSurface: Color(0xFFE1F4FF),
  inverseSurface: Color(0xFF003547),
  inversePrimary: Color(0xFF4CDADA),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006A6A),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF4CDADA),
  onPrimary: Color(0xFF003737),
  primaryContainer: Color(0xFF004F4F),
  onPrimaryContainer: Color(0xFF6FF7F6),
  secondary: Color(0xFFFBBB4A),
  onSecondary: Color(0xFF432C00),
  secondaryContainer: Color(0xFF604100),
  onSecondaryContainer: Color(0xFFFFDEAD),
  tertiary: Color(0xFF81D997),
  onTertiary: Color(0xFF003919),
  tertiaryContainer: Color(0xFF005228),
  onTertiaryContainer: Color(0xFF9CF6B1),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F2A),
  onBackground: Color(0xFFBFE9FF),
  surface: Color(0xFF001F2A),
  onSurface: Color(0xFFBFE9FF),
  surfaceVariant: Color(0xFF3F4948),
  onSurfaceVariant: Color(0xFFBEC9C8),
  outline: Color(0xFF889392),
  onInverseSurface: Color(0xFF001F2A),
  inverseSurface: Color(0xFFBFE9FF),
  inversePrimary: Color(0xFF006A6A),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4CDADA),
);
