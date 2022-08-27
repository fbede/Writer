import 'package:flutter/material.dart';
import 'package:writer/ui/app_settings/widgets/app_settings_widgets.dart';

class DesktopAppSettingsPage extends StatelessWidget {
  const DesktopAppSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: SettingsBody(scafoldBuildContext: context));
}
