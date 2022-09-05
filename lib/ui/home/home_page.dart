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

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({Key? key, this.homeIndex = 0, this.settingsIndex = 0})
      : super(key: key);

  final int homeIndex;
  final int settingsIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: homeIndex, children: [
      const DesktopLibraryPage(),
      DesktopAppSettingsPage(selectedIndex: settingsIndex)
    ]);
  }
}
