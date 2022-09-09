import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, int homeIndex = 0, int subRouteIndex = 0})
      : _key = key as Key,
        _homeIndex = homeIndex,
        mobileBody = MobileHomePage(
          key: key,
          index: homeIndex,
        ),
        desktopBody = [
          const TabletLibraryPage(),
          TabletAppSettingsPage(selectedIndex: subRouteIndex)
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
