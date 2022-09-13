import 'package:flutter/material.dart';
import '../../functions/settings_functions.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';
import 'package:go_router/go_router.dart';
import '../../../router/router.dart';
import '../../../utils/utils.dart';

class DesktopAppSettingsPage extends StatelessWidget {
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsSideBar extends StatelessWidget {
  const SettingsSideBar({
    Key? key,
    this.selectedIndex = 1,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSideBarWidth(context),
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(children: [
        //Title
        GeneralTitleBlock(
          title: stringSettings,
          titleStyle: Theme.of(context).textTheme.displayMedium,
        ),

        //Empty Expanded Space
        Expanded(
          child: SizedBox.fromSize(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
              child: MobileSettingsBody(
                index: selectedIndex,
              ),
            ),
          ),
        ),

        ListTile(
          leading: bookIcon,
          title: const Text(stringLibrary),
          onTap: () => context
              .goNamed(homePath, params: {homePath: indexToHomePath(index: 0)}),
          onLongPress: () {},
        ),

        const SizedBox(height: 5)
      ]),
    );
  }
}
