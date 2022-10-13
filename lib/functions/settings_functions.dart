import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/cubits.dart';
import '../router/router.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

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
      return darkModeIcon;
    case ThemeMode.light:
      return lightModeIcon;
    case ThemeMode.system:
      return systemThemeModeIcon;
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
          builder: (_) => const SelectThemeModeWidget());
    } else {
      context.pushNamed(aboutAppPath, params: {
        homePath: indexToHomePath(index: 1),
        homeSubPath: indexToSettingsPath(index: index)
      });
    }
  } else {
    context.goNamed(homeSubPath, params: {
      homePath: indexToHomePath(index: 1),
      homeSubPath: indexToSettingsPath(index: index)
    });
  }
}

//builds the appbar for the pages
buildSecondaryAppBar(int index) {
  if (index == 1) {
  } else {
    return AppBar(
        title: const Text(stringAboutApp),
        centerTitle: true,
        automaticallyImplyLeading: false);
  }
}
