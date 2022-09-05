import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/ui/settings/widgets/mobile_settings_body.dart';
import 'package:writer/ui/settings/widgets/mobile_settings_body_min.dart';
import '../../../router/router.dart';
import '../../../utils/utils.dart';

class SettingsSideBar extends StatefulWidget {
  const SettingsSideBar({
    Key? key,
    this.isCollapsed = false,
    this.selectedIndex = 1,
  }) : super(key: key);
  final bool isCollapsed;
  final int selectedIndex;

  @override
  State<SettingsSideBar> createState() => _SettingsSideBarState();
}

class _SettingsSideBarState extends State<SettingsSideBar> {
  late bool isCollapsed;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    isCollapsed = widget.isCollapsed;
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(covariant SettingsSideBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    isCollapsed = widget.isCollapsed;
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    if (isCollapsed) {
      return Container(
        width: 60,
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () => setState(() {
                        isCollapsed = !isCollapsed;
                      }),
                  icon: const Icon(Icons.menu)),
            ),

            //Empty Expanded Space
            Expanded(
                child: SizedBox.fromSize(
              child: MobileSettingsBodyMin(isCollapsed: isCollapsed),
            )),

            //Trailing icons

            IconButton(
                onPressed: () => context.goNamed(homePath,
                    params: {homePath: indexToHomePath(index: 0)}),
                icon: const Icon(Icons.class_)),
            const SizedBox(height: 8),
          ],
        ),
      );
    }
    return Container(
        width: 300,
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(children: [
          //Title
          Stack(
            children: [
              buildTitle(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () => setState(() {
                          isCollapsed = !isCollapsed;
                        }),
                    icon: const Icon(Icons.menu)),
              ),
            ],
          ),

          //Empty Expanded Space
          Expanded(
              child: SizedBox.fromSize(
                  child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
            child: MobileSettingsBody(
              index: selectedIndex,
            ),
          ))),

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
