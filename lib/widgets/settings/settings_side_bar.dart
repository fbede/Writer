import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/router.dart';
import '../../../utils/utils.dart';
import 'mobile_settings_body.dart';

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
          buildTitle(context),

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
            leading: const Icon(Icons.class_),
            title: const Text(stringLibrary),
            onTap: () => context.goNamed(homePath,
                params: {homePath: indexToHomePath(index: 0)}),
            onLongPress: () {},
          ),

          const SizedBox(height: 5)
        ]));
  }
}

//Build title
Widget buildTitle(BuildContext context, {double opacity = 0}) {
  return AspectRatio(
    aspectRatio: 1.0,
    child: Center(
      child: Text(stringSettings,
          style: Theme.of(context).textTheme.displayMedium),
    ),
  );
}
