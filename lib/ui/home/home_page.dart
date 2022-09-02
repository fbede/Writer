import 'package:flutter/material.dart';
import 'package:writer/ui/home/mobile_home_page.dart';
import 'package:writer/ui/library/desktop_library_page.dart';

import '../../utils/utils.dart';
import '../settings/pages/desktop_settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, int homeIndex = 0, settingsIndex = 0})
      : _key = key as Key,
        _homeIndex = homeIndex,
        _settingsIndex = settingsIndex,
        super(key: key);
  final Key _key;
  final int _homeIndex;
  final int _settingsIndex;

  @override
  Widget build(BuildContext context) {
    return buildResponsivePage(
        mobileLayout: MobileHomePage(
          key: _key,
          index: _homeIndex,
        ),
        desktopLayout: DesktopHomePage(
          key: _key,
          homeIndex: _homeIndex,
          settingsIndex: _settingsIndex,
        ));
  }
}

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({Key? key, homeIndex = 0, settingsIndex = 0})
      : _homeIndex = homeIndex,
        _settingsIndex = settingsIndex,
        _key = key as Key,
        super(key: key);
  final Key _key;
  final int _homeIndex;
  final int _settingsIndex;

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  late Key key;
  late int homeIndex;
  late int settingsIndex;
  late final List<Widget> body;

  @override
  void initState() {
    super.initState();
    key = widget._key;
    homeIndex = widget._homeIndex;
    settingsIndex = widget._settingsIndex;
    body = [
      const DesktopLibraryPage(),
      DesktopAppSettingsPage(selectedIndex: settingsIndex)
    ];
  }

  @override
  void didUpdateWidget(covariant DesktopHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    key = widget._key;
    homeIndex = widget._homeIndex;
    settingsIndex = widget._settingsIndex;
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: homeIndex,
      children: body,
    );
  }
}
