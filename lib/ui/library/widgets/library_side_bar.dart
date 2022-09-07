import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/utils.dart';
import '../../../router/router.dart';
import '../cubit/library_cubit.dart';

class LibrarySideBar extends StatelessWidget {
  const LibrarySideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getSideBarWidth(context),
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(children: [
          //Title
          const LibraryTitleBlock(),

          //Empty Expanded Space
          Expanded(child: SizedBox.fromSize()),

          ListTile(
            leading: const Icon(Icons.create_new_folder),
            title: const Text('Create New Series'),
            onTap: () {},
            onLongPress: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Create New Book'),
            onTap: () {},
            onLongPress: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => context.goNamed(settingsPath, params: {
              homePath: indexToHomePath(index: 1),
              settingsPath: indexToSettingsPath(index: 1)
            }),
            onLongPress: () {},
          ),

          const SizedBox(height: 5)
        ]));
  }
}

//this is the title block used in the library pages
class LibraryTitleBlock extends StatelessWidget {
  const LibraryTitleBlock({Key? key, this.opacity = 0}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              opacity: 1 - opacity,
              child: Text(stringLibrary,
                  style: Theme.of(context).textTheme.displayMedium),
            ),
            const SizedBox(height: 14),
            Opacity(
              opacity: 1 - opacity,
              child: Text(
                'Series: ${context.watch<LibraryCubit>().state.seriesNum}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 5),
            Opacity(
              opacity: 1 - opacity,
              child: Text(
                'Books: ${context.watch<LibraryCubit>().state.bookNum}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
