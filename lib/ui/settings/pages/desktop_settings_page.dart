import 'package:flutter/material.dart';
import 'package:writer/ui/settings/widgets/settings_widgets.dart';

import '../../../utils/utils.dart';

class DesktopAppSettingsPage extends StatelessWidget {
  const DesktopAppSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Row(
        children: [
          //Left Section
          LeftSideBar(
            isCollapsed: shouldCollapse(context),
          ),

          const VerticalDivider(width: 2),
          //Right Section
          //TODO: Implement Desktop Right Section
          const Expanded(flex: 1, child: SettingsBody()),
        ],
      ));
}
