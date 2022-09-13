import 'package:flutter/material.dart';
import 'package:writer/pages/mobile/mobile_create_edit_book_page.dart';
import 'package:writer/pages/mobile/mobile_create_edit_series_page.dart';
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
          const DesktopLibraryPage(),
          DesktopAppSettingsPage(selectedIndex: subRouteIndex)
        ],
        super(key: key);

  final int _subRouteIndex;
  final int _homeIndex;
  final List<Widget> mobileBody;
  final List<Widget> tabletBody;

  @override
  Widget build(BuildContext context) {
    return buildResponsivePageTwoOptions(
      mobileLayout: mobileBody[_subRouteIndex],
      desktopLayout: tabletBody[_homeIndex],
    );
  }
}
