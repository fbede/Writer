import 'package:flutter/material.dart';
import 'package:writer/ui/settings/pages/about_us_page.dart';
import 'package:writer/ui/settings/widgets/settings_widgets.dart';
import '../functions/settings_functions.dart';

class DesktopAppSettingsPage extends StatefulWidget {
  const DesktopAppSettingsPage({Key? key, this.selectedIndex = 1})
      : super(key: key);

  final int selectedIndex;
  final List<Widget> rightSection = const [
    //nothing should be here
    SizedBox(),
    SelectThemeModeWidget(),
    AboutAppPageBody()
  ];

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
                    children: widget.rightSection,
                  ),
                ))),
      ],
    ));
  }
}
