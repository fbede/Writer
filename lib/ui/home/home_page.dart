import 'package:flutter/material.dart';
import 'package:writer/ui/home/mobile_home_page.dart';
import 'package:writer/ui/library/pages/desktop_library_page.dart';
import '../../utils/utils.dart';
import '../settings/pages/desktop_settings_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, int homeIndex = 0, settingsIndex = 0})
      : _key = key as Key,
        _homeIndex = homeIndex,
        mobileBody = MobileHomePage(
          key: key,
          index: homeIndex,
        ),
        desktopBody = [
          const DesktopLibraryPage(),
          DesktopAppSettingsPage(selectedIndex: settingsIndex)
        ],
        super(key: key);

  //TODO discover if page keys must be passed to ancestor widgets
  //when using go_router
  final Key _key;
  final int _homeIndex;
  final Widget mobileBody;
  final List<Widget> desktopBody;

  @override
  Widget build(BuildContext context) {
    return buildResponsivePageTwoOptions(
      mobileLayout: MobileHomePage(
        key: _key,
        index: _homeIndex,
      ),
      desktopLayout: desktopBody[_homeIndex],
    );
  }
}
