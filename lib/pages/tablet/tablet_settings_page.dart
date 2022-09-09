import 'package:flutter/material.dart';
import '../../functions/settings_functions.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

class TabletAppSettingsPage extends StatelessWidget {
  const TabletAppSettingsPage({Key? key, this.selectedIndex = 1})
      : super(key: key);

  final int selectedIndex;
  final List<Widget> rightSection = const [
    //nothing should be here
    SizedBox(),
    SelectThemeModeWidget(),
    AboutAppPageBody()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        //Left Section
        SettingsSideBar(
          selectedIndex: selectedIndex,
        ),

        const VerticalDivider(width: 2),

        //Right Section
        Expanded(
            child: Scaffold(
                appBar: buildSecondaryAppBar(selectedIndex),
                body: Padding(
                  padding: const EdgeInsetsDirectional.all(8.0),
                  child: IndexedStack(
                    index: selectedIndex,
                    children: rightSection,
                  ),
                ))),
      ],
    ));
  }
}
