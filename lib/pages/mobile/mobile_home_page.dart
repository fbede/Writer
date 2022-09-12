import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/utils/utils.dart';
import '../../router/router.dart';
import 'mobile_library_page.dart';
import 'mobile_settings_page.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key, this.index = 0}) : super(key: key);
  final int index;
  final body = const [MobileLibraryPage(), MobileAppSettingsPage()];

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
              .goNamed(homePath, params: {homePath: indexToHomePath(index: i)}),
          destinations: const [
            NavigationDestination(
                icon: Icon(bookIcon),
                label: stringLibrary,
                selectedIcon: Icon(activeBookIcon)),
            NavigationDestination(
              icon: Icon(settingsIcon),
              label: stringSettings,
              selectedIcon: Icon(activeSettingsIcon),
            ),
          ]),
    );
  }
}
