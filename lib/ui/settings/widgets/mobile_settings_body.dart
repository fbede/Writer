import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/router/router.dart';
import '../../../utils/utils.dart';

import '../functions/settings_functions.dart';
import 'select_theme_mode_widget.dart';

class MobileSettingsBody extends StatefulWidget {
  const MobileSettingsBody(
      {Key? key, this.shouldShrinkWrap = false, this.index = 0})
      : super(key: key);

  final bool shouldShrinkWrap;
  final int index;

  @override
  State<MobileSettingsBody> createState() => _MobileSettingsBodyState();
}

class _MobileSettingsBodyState extends State<MobileSettingsBody> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
  }

  @override
  void didUpdateWidget(covariant MobileSettingsBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }

  //this runs when the theme select button is pressed
  selectTheme(BuildContext context, int index) {
    if (isMobile(context)) {
      if (index == 1) {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: bottomSheetShape,
            builder: (context) => SelectThemeModeWidget(
                  context: context,
                ));
      }
      if (index == 2) {
        context.pushNamed(aboutAppPath, params: {
          homePath: indexToHomePath(index: 1),
          settingsPath: indexToSettingsPath(index: index)
        });
      }
    } else {
      setState(() {
        selectedIndex = index;
      });
      context.goNamed(settingsPath, params: {
        homePath: indexToHomePath(index: 1),
        settingsPath: indexToSettingsPath(index: index)
      });
    }
  }

  //this takes the user to the page with the said index
}
