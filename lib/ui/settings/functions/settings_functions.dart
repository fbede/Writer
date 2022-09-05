import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../router/router.dart';
import '../../../utils/utils.dart';
import '../cubit/settings_cubit.dart';
import '../widgets/settings_widgets.dart';

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

//this runs when any settings button is pressed
handleTap(BuildContext context, int index) {
  if (isMobile(context)) {
    if (index == 1) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: bottomSheetShape,
          builder: (context) => SelectThemeModeWidget(
                context: context,
              ));
    } else {
      context.pushNamed(aboutAppPath, params: {
        homePath: indexToHomePath(index: 1),
        settingsPath: indexToSettingsPath(index: index)
      });
    }
  } else {
    context.goNamed(settingsPath, params: {
      homePath: indexToHomePath(index: 1),
      settingsPath: indexToSettingsPath(index: index)
    });
  }
}
