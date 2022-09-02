import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/router/router.dart';
import '../../../utils/utils.dart';

import '../functions/settings_functions.dart';
import 'select_theme_mode_widget.dart';

class SettingsBodyMax extends StatefulWidget {
  const SettingsBodyMax(
      {Key? key, this.shouldShrinkWrap = false, this.index = 0})
      : super(key: key);

  final bool shouldShrinkWrap;
  final int index;

  @override
  State<SettingsBodyMax> createState() => _SettingsBodyMaxState();
}

class _SettingsBodyMaxState extends State<SettingsBodyMax> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
  }

  @override
  void didUpdateWidget(covariant SettingsBodyMax oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      tileColor: Theme.of(context).appBarTheme.backgroundColor,
      child: Material(
        type: MaterialType.transparency,
        child: ListView(
          shrinkWrap: widget.shouldShrinkWrap,
          children: [
            //Theme ListTile
            ListTile(
              selected: selectedIndex == 1,
              leading: getThemeIcon(context: context),
              title: const Text(stringTheme),
              subtitle: getThemeSubtitle(context: context),
              onTap: () => selectTheme(context, 1),
              onLongPress: () {},
            ),

            const Divider(height: 2, thickness: 2),

            //About ListTile
            //TODO: Add legalese and details later
            ListTile(
              selected: selectedIndex == 2,
              leading: const Icon(
                Icons.info,
              ),
              title: const Text(stringAboutApp),
              subtitle: const Text(stringAppVersion),
              //implement go_router after desktop
              onTap: () => selectTheme(context, 2),
              onLongPress: () {},
            )
          ],
        ),
      ),
    );
  }

  //this runs when the theme select button is pressed
  selectTheme(BuildContext context, int index) {
    if (isMobile(context)) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: bottomSheetShape,
          builder: (context) => SelectThemeModeWidget(
                context: context,
              ));
    } else {
      setState(() {
        selectedIndex = index;
      });
      context.goNamed(settingsPath, params: {
        'page': indexToHomePath(index: 1),
        'settingsIndex': indexToSettingsPath(index: index)
      });
    }
  }

  //this takes the user to the page with the said index
}
