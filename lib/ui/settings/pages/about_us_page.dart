import 'package:flutter/material.dart';
import 'package:writer/ui/settings/pages/licenses_page.dart';

import '../../../utils/utils.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          //TODO: Design later

          //Advertise our other apps if any
          //Important news from us
          //Info on the team
          //Social accounts
          //Credits
          //Changelog
          //Privacy Policy
          //UserFeedback
          const Text('Design this page later'),
          ElevatedButton(
              //Implement router navigation after designing desktop page
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LicensesPage())),
              child: const Text(stringViewLicenses))
        ],
      ),
    );
  }
}
