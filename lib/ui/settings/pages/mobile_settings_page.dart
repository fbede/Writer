import 'package:flutter/material.dart';
import 'package:writer/ui/common/widgets/common_widgets.dart';
import 'package:writer/utils/strings.dart';

import '../../common/functions/ui_fuctions.dart';
import '../widgets/settings_widgets.dart';

class MobileAppSettingsPage extends StatefulWidget {
  const MobileAppSettingsPage({Key? key}) : super(key: key);

  @override
  State<MobileAppSettingsPage> createState() => _MobileAppSettingsPageState();
}

class _MobileAppSettingsPageState extends State<MobileAppSettingsPage> {
  late double opacity;

  @override
  void initState() {
    super.initState();
    opacity = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //Used to make the title fade as the user scrolls
        body: NotificationListener(
      onNotification: ((ScrollMetricsNotification notification) {
        setState(() {
          opacity = handleScrollNotification(
              notification: notification, context: context);
        });
        return true;
      }),
      child: CustomScrollView(
        slivers: [
          //Invisible AppBar (Not noticed by user)
          const SliverAppBarFactory(),

          //TitleWidget
          buildTitleBlock(context, opacity),

          //TrueAppBar
          SliverAppBarFactory(
            title: stringSettings,
            isPinned: true,
            opacity: opacity,
          ),

          //builds the body that shows the list of available settings
          buildSettingsBody(context),
        ],
      ),
    ));
  }

//builds the settings body
  SliverToBoxAdapter buildSettingsBody(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
            child: MobileSettingsBody(
          shouldShrinkWrap: true,
        )),
      ),
    );
  }

//builds the title block
  SliverToBoxAdapter buildTitleBlock(BuildContext context, double opacity) {
    return SliverToBoxAdapter(
      child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: MediaQuery.of(context).size.width * 0.6,
          child: Opacity(
            opacity: 1 - opacity,
            child: Center(
              child: Text(
                stringSettings,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          )),
    );
  }
}
