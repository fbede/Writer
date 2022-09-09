import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router.dart';
import '../../utils/utils.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(stringAboutApp),
      ),
      body: const AboutAppPageBody(),
    );
  }
}

class AboutAppPageBody extends StatelessWidget {
  const AboutAppPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            onPressed: () => context.pushNamed(licensesPagePath, params: {
                  homePath: indexToHomePath(index: 1),
                  homePageSubPath: indexToSettingsPath(index: 1)
                }),
            child: const Text(stringViewLicenses))
      ],
    );
  }
}
