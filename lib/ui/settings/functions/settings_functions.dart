import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../cubit/settings_cubit.dart';

Text getThemeSubtitle({required BuildContext context}) {
  switch (context.watch<SettingsCubit>().state.themeMode) {
    case ThemeMode.dark:
      return const Text(stringThemeModeDark);
    case ThemeMode.light:
      return const Text(stringThemeModeLight);
    case ThemeMode.system:
      return const Text(stringThemeModeSystem);
  }
}

Icon getThemeIcon({required BuildContext context}) {
  switch (context.watch<SettingsCubit>().state.themeMode) {
    case ThemeMode.dark:
      return const Icon(Icons.dark_mode);
    case ThemeMode.light:
      return const Icon(Icons.light_mode);
    case ThemeMode.system:
      return const Icon(Icons.computer);
  }
}
