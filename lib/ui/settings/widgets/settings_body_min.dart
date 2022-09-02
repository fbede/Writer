import 'package:flutter/material.dart';

import 'package:writer/ui/settings/pages/about_us_page.dart';
import '../../../utils/utils.dart';

import '../functions/settings_functions.dart';
import 'select_theme_mode_widget.dart';

class SettingsBodyMin extends StatelessWidget {
  const SettingsBodyMin(
      {Key? key, this.isCollapsed = false, this.shouldShrinkWrap = false})
      : super(key: key);
  final bool isCollapsed;
  final bool shouldShrinkWrap;
  final int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    if (isCollapsed) {
      return buildCollapsedForm(context);
    }
    return buildExpandedForm(context);
  }

  //This is the design of the sidebar when it is collapsed
  Widget buildCollapsedForm(BuildContext context) => SizedBox.fromSize();

  //This is the design of the sidebar when it is expanded
  Widget buildExpandedForm(BuildContext context) {
    return ListView(
      shrinkWrap: shouldShrinkWrap,
      children: [
        //Theme ListTile
        ListTile(
          leading: getThemeIcon(context: context),
          title: const Text(stringTheme),
          subtitle: getThemeSubtitle(context: context),
          onTap: () {
            if (isMobile(context)) {
            } else {}
          },
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
    } else {}
  }
}
