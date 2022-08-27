import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:writer/ui/app_settings/pages/about_us_page.dart';
import '../../../utils/utils.dart';
import '../cubit/settings_cubit.dart';
import 'select_theme_mode_widget.dart';

class SettingsBody extends StatelessWidget {
  final BuildContext scafoldBuildContext;

  const SettingsBody({Key? key, required this.scafoldBuildContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Theme ListTile
        ListTile(
          leading: getThemeIcon(context: context),
          title: const Text(stringTheme),
          subtitle: getThemeSubtitle(context: context),
          onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: bottomSheetShape,
              builder: (context) => SelectThemeModeWidget(
                    context: context,
                  )),
          onLongPress: () {},
        ),

        const Divider(),

        //About ListTile
        //TODO: Add legalese and details later
        ListTile(
          leading: const Icon(
            Icons.info,
          ),
          title: const Text(stringAboutApp),
          subtitle: const Text(stringAppVersion),
          //implement go_router after desktop
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AboutUsPage())),
          onLongPress: () {},
        )
      ],
    );
  }

  Text getThemeSubtitle({required BuildContext context}) {
    switch (context.read<SettingsCubit>().state.themeMode) {
      case ThemeMode.dark:
        return const Text(stringThemeModeDark);
      case ThemeMode.light:
        return const Text(stringThemeModeLight);
      case ThemeMode.system:
        return const Text(stringThemeModeSystem);
    }
  }

  Icon getThemeIcon({required BuildContext context}) {
    switch (context.read<SettingsCubit>().state.themeMode) {
      case ThemeMode.dark:
        return const Icon(Icons.dark_mode);
      case ThemeMode.light:
        return const Icon(Icons.light_mode);
      case ThemeMode.system:
        return const Icon(Icons.computer);
    }
  }
}
