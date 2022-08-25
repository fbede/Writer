import 'package:flutter/material.dart';
import 'package:writer/ui/home/desktop_home_page.dart';
import 'package:writer/ui/home/mobile_home_page.dart';
import 'package:writer/utils/responsive_page.dart';

import '../app_settings/pages/app_settings_page.dart';
import '../library/mobile_library_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, int index = 0})
      : _key = key as Key,
        _index = index,
        super(key: key);
  final Key _key;
  final int _index;
  final body = const [MobileLibraryPage(), AppSettingsPage()];
  final desktopbody = const [Text('yo'), Text('yo'), AppSettingsPage()];

  @override
  Widget build(BuildContext context) {
    return buildResponsivePage(
        mobileLayout: MobileHomePage(
          key: _key,
          index: _index,
          body: body,
        ),
        desktopLayout: DesktopHomePage(
          key: _key,
          index: _index,
          body: body,
        ));
  }
}
