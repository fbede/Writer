import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../utils/strings.dart';
import '../cubits/home_page_cubit.dart';

// This file contains widgets that are common to both tablet and mobile views

//SpeedDial or FloatingActionButton
class HomePageFloatingActionButton extends StatelessWidget {
  const HomePageFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animationDuration: const Duration(milliseconds: 250),
      animatedIcon: AnimatedIcons.menu_close,
      overlayOpacity: 0.0,
      spacing: 12,
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
            child: const Icon(Icons.book),
            label: stringCreateNewBook,
            onTap: () {
              context.read<HomePageCubit>().createNewBook();
            }),
        SpeedDialChild(
            child: const Icon(Icons.folder),
            label: stringCreateNewSeries,
            onTap: () {
              context.read<HomePageCubit>().createNewSeries();
            })
      ],
    );
  }
}

//This determines how each project, book or series looks
class ProjectView extends StatelessWidget {
  const ProjectView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // TODO Implement open later
      onTap: () {},
      onLongPress: () {},
      onHover: (hover) {},
      enableFeedback: true,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1.5,
              child: Stack(children: [
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.blueGrey),
                )),
                Positioned.fill(
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Icon(
                        Icons.book,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                ),
              ]),
            ),
            Row(
              //TODO Confirm Text position in tabview
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Title',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),

                //TODO change to menu button
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            )
          ],
        ),
      ),
    );
  }
}

// This is how the grid view looks on all layouts
class ProjectGridView extends StatelessWidget {
  const ProjectGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
        builder: ((context, state) {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1 / 1.7, maxCrossAxisExtent: 150),
        delegate: SliverChildBuilderDelegate(childCount: state.totalProjects,
            (context, index) {
          return const ProjectView();
        }),
      );
    }));
  }
}
