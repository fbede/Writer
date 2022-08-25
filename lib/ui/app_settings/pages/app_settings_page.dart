import 'package:flutter/material.dart';
import 'package:writer/utils/responsive_page.dart';
import 'mobile_app_settings_page.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildResponsivePage(
        mobileLayout: MobileAppSettingsPage(),
        //TODO Build desktop page
        desktopLayout: MobileAppSettingsPage());
  }
}
