import 'package:flutter/material.dart';
import 'package:writer/ui/settings/pages/about_us_page.dart';
import 'package:writer/ui/settings/widgets/settings_widgets.dart';

import '../../../utils/utils.dart';

class DesktopAppSettingsPage extends StatefulWidget {
  const DesktopAppSettingsPage({Key? key, this.selectedIndex = 1})
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
          SettingsSideBar(
            isCollapsed: shouldCollapse(context),
            selectedIndex: selectedIndex,
          ),

          const VerticalDivider(width: 2),

          //Right Section
          //TODO: Fix bug where side bar uncollapses when new option is selected
          Expanded(
              child: Scaffold(
                  appBar: buildAppBar(selectedIndex),
                  body: Padding(
                    padding: const EdgeInsetsDirectional.all(8.0),
                    child: IndexedStack(
                      index: selectedIndex,
                      //list of all possible children pages
                      children: const [
                        SizedBox(), //nothing should be here
                        SelectThemeModeWidget(),
                        AboutAppPageBody()
                      ],
                    ),
                  ))),
        ],
      ));

  //builds the appbar for the page
  buildAppBar(int index) {
    if (index == 1) {
    } else {
      return AppBar(
          title: const Text(stringAboutApp),
          centerTitle: true,
          automaticallyImplyLeading: false);
    }
  }
}
