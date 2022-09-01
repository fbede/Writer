import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/ui/settings/widgets/settings_body.dart';
import '../../../router/main_routes.dart';
import '../../../router/router_paths.dart';
import '../../../utils/utils.dart';

class LeftSideBar extends StatefulWidget {
  const LeftSideBar({
    Key? key,
    this.isCollapsed = false,
  }) : super(key: key);
  final bool isCollapsed;

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  late bool isCollapsed;

  @override
  void initState() {
    super.initState();
    isCollapsed = widget.isCollapsed;
  }

  @override
  void didUpdateWidget(covariant LeftSideBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    isCollapsed = widget.isCollapsed;
  }

  @override
  Widget build(BuildContext context) {
    if (isCollapsed) {
      return Container(
        width: 60,
        color: getAppBarBackgroundColor(context),
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
              child: SettingsBody(isCollapsed: isCollapsed),
            )),

            //Trailing icons

            IconButton(
                onPressed: () => context.goNamed(homePath,
                    params: {'page': indexToHomePath(index: 0)}),
                icon: const Icon(Icons.class_)),
            const SizedBox(height: 8),
          ],
        ),
      );
    }
    return Container(
        width: 300,
        color: getAppBarBackgroundColor(context),
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
                  child: SettingsBody(isCollapsed: isCollapsed))),

          ListTile(
            leading: const Icon(Icons.class_),
            title: const Text(stringLibrary),
            onTap: () => context
                .goNamed(homePath, params: {'page': indexToHomePath(index: 0)}),
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
