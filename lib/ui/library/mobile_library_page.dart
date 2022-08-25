import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:writer/ui/library/cubit/library_cubit.dart';
import 'package:writer/ui/library/library_widgets.dart';

class MobileLibraryPage extends StatefulWidget {
  const MobileLibraryPage({Key? key}) : super(key: key);

  @override
  State<MobileLibraryPage> createState() => _MobileLibraryPageState();
}

class _MobileLibraryPageState extends State<MobileLibraryPage> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              context.read<LibraryCubit>().createProject();
            }),
            //Used to make the title fade as the user scrolls
            body: NotificationListener(
              onNotification: ((ScrollMetricsNotification notification) =>
                  _handleScrollNotification(notification: notification)),
              child: CustomScrollView(
                slivers: [
                  //First AppBar (Not noticed by user)
                  SliverAppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),

                  //TitleWidget
                  LibraryTitleBlock(opacity: opacity),
                  LibraryAppBar(opacity: opacity),

                  SliverToBoxAdapter(
                    child: SizedBox(height: 5000),
                  )
                ],
              ),
            )));
  }

  bool _handleScrollNotification(
      {required ScrollMetricsNotification notification}) {
    var percentScrolled = notification.metrics.extentBefore /
        (MediaQuery.of(context).size.width * 0.7);
    double o = percentScrolled * 1 / 0.6;
    if (o >= 1) {
      o = 1.0;
    }
    setState(() {
      opacity = o;
    });
    return true;
  }
}
