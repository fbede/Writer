import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:writer/router/router_paths.dart';
import '../../router/main_routes.dart';
import '../../utils/strings.dart';

import '../app_settings/pages/app_settings_page.dart';
import '../library/mobile_library_page.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key, required this.body, this.index = 0})
      : super(key: key);
  final int index;
  final List<Widget> body;

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  void didUpdateWidget(covariant MobileHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: IndexedStack(
        index: index,
        children: widget.body,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    ));
  }

//method creates the navigationbar
  NavigationBarTheme _buildBottomNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          height: 70,
          labelTextStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.labelLarge)),
      child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (i) => context
              .goNamed(homePath, params: {'page': indexToHomePath(index: i)}),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.class_outlined),
                label: stringLibrary,
                selectedIcon: Icon(Icons.class_)),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: stringSettings,
              selectedIcon: Icon(Icons.settings),
            ),
          ]),
    );
  }
}
