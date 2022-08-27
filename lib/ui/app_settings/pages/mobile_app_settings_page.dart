import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/router/router_paths.dart';
import 'package:writer/ui/app_settings/cubit/settings_cubit.dart';
import 'package:writer/ui/common/cubits/ui_text_opacity_cubit.dart';
import 'package:writer/ui/common/widgets.dart';
import 'package:writer/utils/shapes.dart';
import 'package:writer/utils/strings.dart';

import '../../../router/main_routes.dart';
import '../widgets/app_settings_widgets.dart';

class MobileAppSettingsPage extends StatelessWidget {
  const MobileAppSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double opacity = context.watch<TextOpacityCubit>().state;
    return Scaffold(

        //Used to make the title fade as the user scrolls
        body: NotificationListener(
      onNotification: ((ScrollMetricsNotification notification) => context
          .read<TextOpacityCubit>()
          .handleScrollNotification(
              notification: notification, context: context)),
      child: CustomScrollView(
        slivers: [
          //Invisible AppBar (Not noticed by user)
          SliverAppBarFactory(
            opacity: opacity,
          ),

          //TitleWidget
          buildTitleBlock(context, opacity),

          //TrueAppBar
          SliverAppBarFactory(
            opacity: opacity,
            title: stringSettings,
            isPinned: true,
          ),

          //builds the body that shows the list of available settings
          buildSettingsBody(context),
        ],
      ),
    ));
  }

//builds the settings body
  SliverToBoxAdapter buildSettingsBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            child: SettingsBody(
          scafoldBuildContext: context,
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
