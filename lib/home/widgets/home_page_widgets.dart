import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:writer/home/cubits/library_cubit.dart';
import '../../utils/strings.dart';
import '../cubits/home_page_cubit.dart';

// This file contains widgets that are common to both tablet and mobile home views

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
            childAspectRatio: 1 / 1.8, maxCrossAxisExtent: 150),
        delegate: SliverChildBuilderDelegate(childCount: state.totalProjects,
            (context, index) {
          return const ProjectView();
        }),
      );
    }));
  }
}

//This determines how each project, book or series looks
class ProjectView extends StatelessWidget {
  const ProjectView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(8.0),
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        elevation: 2,
        child: InkWell(
          //TODO: Implement later
          onTap: () {},
          //TODO: Add full functionality later
          onLongPress: () {
            context.read<HomePageCubit>().setSelectionMode();
          },
          enableFeedback: true,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1.5,
                child: Stack(children: [
                  Positioned.fill(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(),
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
                  PopupMenuButton(
                      elevation: 2,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) {
                        //These are the menu items for right hand click

                        final List<PopupMenuItem> homePageMenuItems = [
                          // TODO Add more functionality like Covert to series or convert to book etc
                          PopupMenuItem(
                            onTap: context.read<HomePageCubit>().deletesASeries,
                            child: const Text(stringDelete),
                          )
                        ];
                        return homePageMenuItems;
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
