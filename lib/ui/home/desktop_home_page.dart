//This file determines what version of the page to display
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/router/main_routes.dart';
import '../../router/router_paths.dart';
import '../../utils/strings.dart';

//TODO  Customize Desktop Home Page
class DesktopHomePage extends StatefulWidget {
  final int index;
  final List<Widget> body;
  const DesktopHomePage({Key? key, required this.body, this.index = 0})
      : super(key: key);

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  void didUpdateWidget(covariant DesktopHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Row(
        children: [
          buildNavRail(),
          Expanded(
            child: IndexedStack(
              index: index,
              children: widget.body,
            ),
          ),
        ],
      ),
    ));
  }

  //final body = <Widget>[Text('yo'), MobileNotesPage(), AppSettingsPage()];

  buildNavRail() {
    return NavigationRail(
        destinations: const [
          NavigationRailDestination(
              icon: Icon(Icons.class_outlined),
              label: Text(stringLibrary),
              selectedIcon: Icon(Icons.class_)),
          NavigationRailDestination(
            icon: Icon(Icons.settings_outlined),
            label: Text(stringSettings),
            selectedIcon: Icon(Icons.settings),
          ),
        ],
        selectedIndex: index,
        onDestinationSelected: (i) => context
            .goNamed(homePath, params: {'page': indexToHomePath(index: i)}));
  }
}
