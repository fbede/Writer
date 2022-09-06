import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:writer/logic/models/app_projects.dart';

import 'package:writer/ui/common/functions/ui_fuctions.dart';
import 'package:writer/ui/common/widgets/common_widgets.dart';
import 'package:writer/ui/library/cubit/library_cubit.dart';
import 'package:writer/utils/utils.dart';
import '../widgets/library_side_bar.dart';
import '../widgets/library_widgets.dart';

class MobileLibraryPage extends StatefulWidget {
  const MobileLibraryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileLibraryPage> createState() => _MobileLibraryPageState();
}

class _MobileLibraryPageState extends State<MobileLibraryPage> {
  late double opacity;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    opacity = 0;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: const _LibrarySpeedDial(),
            /* FloatingActionButton(
              onPressed: () => context.read<LibraryCubit>().createProject(),
            ), */

            //Used to make the title fade as the user scrolls
            body: NotificationListener(
              onNotification: (ScrollMetricsNotification notification) {
                setState(() {
                  opacity = handleScrollNotification(
                      notification: notification, context: context);
                });
                return true;
              },
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  const SliverAppBarFactory(),
                  SliverToBoxAdapter(
                    child: LibraryTitleBlock(opacity: opacity),
                  ),
                  SliverAppBarFactory(
                    isPinned: true,
                    title: stringLibrary,
                    opacity: opacity,
                  ),
                  const SliverToBoxAdapter(
                    child: LibraryPageBody(),
                  ),
                ],
              ),
            )));
  }
}

//this is the library speed dial
class _LibrarySpeedDial extends StatelessWidget {
  const _LibrarySpeedDial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Theme.of(context).colorScheme.onSecondary,
      icon: Icons.add,
      overlayOpacity: 0,
      activeIcon: Icons.close,
      spacing: 16,
      spaceBetweenChildren: 12,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      children: [
        SpeedDialChild(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            child: const Icon(Icons.folder),
            label: stringCreateNewSeries,
            onLongPress: () {},
            onTap: () => context.read<LibraryCubit>().createNewSeries()),
        SpeedDialChild(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            child: const Icon(Icons.class_),
            label: stringCreateNewBook,
            onLongPress: () {},
            onTap: () => context.read<LibraryCubit>().createNewBook())
      ],
    );
  }
}
