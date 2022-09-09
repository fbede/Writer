import 'package:flutter/material.dart';
import 'package:writer/utils/utils.dart';

class LicensesPage extends StatelessWidget {
  const LicensesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LicensePage(
      applicationName: stringAppName,
      applicationIcon: Image.asset(
        'lib/assets/logo.png',
        height: 100,
        width: 100,
      ),
      applicationVersion: stringAppVersion);
}
