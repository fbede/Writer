import 'package:flutter/material.dart';
import 'package:writer/ui/home/mobile_home_page.dart';
import 'package:writer/ui/library/desktop_library_page.dart';

import '../../utils/utils.dart';
import '../settings/pages/desktop_settings_page.dart';
import '../settings/pages/mobile_settings_page.dart';
import '../library/mobile_library_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, int index = 0})
      : _key = key as Key,
        _index = index,
        super(key: key);
  final Key _key;
  final int _index;
  final mobileBody = const [MobileLibraryPage(), MobileAppSettingsPage()];
  final desktopbody = const [DesktopLibraryPage(), DesktopAppSettingsPage()];

  @override
  Widget build(BuildContext context) {
    return buildResponsivePage(
        mobileLayout: MobileHomePage(
          key: _key,
          index: _index,
          body: mobileBody,
        ),
        desktopLayout: DesktopHomePage(
          key: _key,
          index: _index,
          body: desktopbody,
        ));
  }
}

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({Key? key, required this.body, this.index = 0})
      : super(key: key);
  final int index;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) => body[index];
}
