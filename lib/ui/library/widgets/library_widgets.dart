import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/models/app_projects.dart';
import '../../../utils/utils.dart';
import '../cubit/library_cubit.dart';

export 'library_side_bar.dart';

class LibraryPageBody extends StatelessWidget {
  const LibraryPageBody({Key? key, this.shouldShrinkWrap = true})
      : super(key: key);

  //!Used by mobile library page. Do not touch
  final bool shouldShrinkWrap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        child: GridView.builder(
            physics: const ScrollPhysics(),
            itemCount: context.watch<LibraryCubit>().state.projectList.length,
            shrinkWrap: shouldShrinkWrap,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: getMaxCrossAxisExtent(),
                mainAxisSpacing: getSpacing(),
                crossAxisSpacing: getSpacing(),
                childAspectRatio: 1 / 2.35),
            itemBuilder: (context, index) {
              List<LibraryProject> projects =
                  context.watch<LibraryCubit>().state.projectList;
              return LibraryBookCard(
                projects: projects,
                index: index,
              );
            }));
  }

  double getMaxCrossAxisExtent() {
    if (shouldShrinkWrap) {
      return 150;
    }
    return 200;
  }

  double getSpacing() {
    if (!shouldShrinkWrap) {
      return 20.0;
    }
    return 8;
  }
}

class LibraryBookCard extends StatelessWidget {
  const LibraryBookCard({Key? key, required this.projects, required this.index})
      : super(key: key);

  final List<LibraryProject> projects;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
              aspectRatio: 1 / 2,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.5,
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: getCoverImage(projects[index], context)),
              )),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: Text(projects[index].projectTitle,
                      textAlign: TextAlign.justify,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              ),
              Transform.scale(
                  scale: 0.75,
                  child: PopupMenuButton(
                      elevation: 2,
                      //color: Theme.of(context).colorScheme.primaryContainer,
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) {
                        //These are the menu items for right hand click

                        final List<PopupMenuItem> homePageMenuItems = [
                          // TODO: Add more functionality like Covert to series or convert to book etc
                          PopupMenuItem(
                            onTap: () {},
                            child: const Text(stringEdit),
                          ),
                          PopupMenuItem(
                            onTap: () {},
                            child: const Text(stringDelete),
                          )
                        ];
                        return homePageMenuItems;
                      }))
            ],
          )
        ],
      ),
    );
  }

  getCoverImage(LibraryProject project, BuildContext context) {
    if (project.coverPhoto != null) {
      //TODO: Finetune Cover Photo Later
      return project.coverPhoto;
    }
    if (project is LibraryBook) {
      return const Icon(Icons.class_);
    }
    if (project is LibrarySeries) {
      return const Icon(Icons.folder);
    }
  }
}
