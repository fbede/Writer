import 'package:flutter/material.dart';
import 'package:writer/ui/settings/widgets/settings_widgets.dart';

import '../../../utils/utils.dart';

class DesktopAppSettingsPage extends StatefulWidget {
  const DesktopAppSettingsPage({Key? key, this.selectedIndex = 0})
      : super(key: key);

  final int selectedIndex;

  @override
  State<DesktopAppSettingsPage> createState() => _DesktopAppSettingsPageState();
}

class _DesktopAppSettingsPageState extends State<DesktopAppSettingsPage> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(covariant DesktopAppSettingsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedIndex = widget.selectedIndex;
  }

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
          Expanded(
              child: Scaffold(
                  body: Padding(
            padding: EdgeInsetsDirectional.all(8.0),
            child: Container(),
          ))),
        ],
      ));
}
