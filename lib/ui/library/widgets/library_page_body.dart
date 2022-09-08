import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/models/app_projects.dart';
import '../../../utils/utils.dart';
import '../cubit/library_cubit.dart';

class DesktopLibraryPageBody extends StatelessWidget {
  const DesktopLibraryPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverPadding(
              padding: EdgeInsetsDirectional.only(start: 8, end: 8),
              sliver: LibraryPageBody())
        ],
      ),
    );
  }
}

class LibraryPageBody extends StatelessWidget {
  const LibraryPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1 / 2),
        delegate: SliverChildBuilderDelegate(
            childCount: context.watch<LibraryCubit>().state.projectList.length,
            (context, index) {
          List<LibraryProject> projects =
              context.watch<LibraryCubit>().state.projectList;
          return _LibraryBookCard(
            projects: projects,
            index: index,
          );
        }),
      ),
    );
  }
}

class _LibraryBookCard extends StatelessWidget {
  const _LibraryBookCard(
      {Key? key, required this.projects, required this.index})
      : super(key: key);

  final List<LibraryProject> projects;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
            aspectRatio: 0.625,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.5,
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: getCoverImage(projects[index], context)),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(children: [
            Row(
              children: [
                Expanded(
                  child: Text(projects[index].projectTitle,
                      textAlign: TextAlign.justify,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const _LibraryPopUpMenuButton()
          ]),
        ),
      ],
    );
  }

  getCoverImage(LibraryProject project, BuildContext context) {
    if (project.coverPhoto != null) {
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

class _LibraryPopUpMenuButton extends StatelessWidget {
  const _LibraryPopUpMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      end: -15,
      child: PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) {
            final List<PopupMenuItem> homePageMenuItems = [
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
          }),
    );
  }
}