import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:writer/ui/common/functions/ui_fuctions.dart';
import 'package:writer/ui/common/widgets/common_widgets.dart';
import 'package:writer/ui/library/cubit/library_cubit.dart';
import 'package:writer/utils/utils.dart';
import '../widgets/library_side_bar.dart';

class MobileLibraryPage extends StatefulWidget {
  const MobileLibraryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileLibraryPage> createState() => _MobileLibraryPageState();
}

class _MobileLibraryPageState extends State<MobileLibraryPage> {
  late double opacity;

  @override
  void initState() {
    super.initState();
    opacity = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: SpeedDial(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
              icon: Icons.add,
              overlayOpacity: 0,
              activeIcon: Icons.close,
              spacing: 16,
              spaceBetweenChildren: 12,
              children: [
                SpeedDialChild(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    child: const Icon(Icons.folder),
                    label: stringCreateNewSeries,
                    onLongPress: () {},
                    onTap: () => context.read<LibraryCubit>().createProject()),
                SpeedDialChild(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    child: const Icon(Icons.class_),
                    label: stringCreateNewBook,
                    onLongPress: () {},
                    onTap: () => context.read<LibraryCubit>().createProject())
              ],
            ),
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
                slivers: [
                  const SliverAppBarFactory(),
                  SliverToBoxAdapter(
                    child: buildTitle(context, opacity: opacity),
                  ),
                  SliverAppBarFactory(
                    isPinned: true,
                    title: stringLibrary,
                    opacity: opacity,
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 5000),
                  )
                ],
              ),
            )));
  }
}
