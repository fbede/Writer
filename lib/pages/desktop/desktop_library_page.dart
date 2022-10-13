import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/utils.dart';
import '../../../router/router.dart';
import '../../cubits/cubits.dart';
import '../../widgets/widgets.dart';

class DesktopLibraryPage extends StatelessWidget {
  const DesktopLibraryPage({Key? key, this.selectedIndex = 0})
      : super(key: key);

  final int selectedIndex;
  final List<Widget> rightSection = const [
    DesktopLibraryPageBody(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            //Left Section
            const LibrarySideBar(),

            const VerticalDivider(width: 2),

            //Right Section
            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: rightSection,
              ),
            )
          ],
        ),
      );
}

class LibrarySideBar extends StatelessWidget {
  const LibrarySideBar({
    Key? key,
    this.selectedIndex = 0,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getSideBarWidth(context),
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(children: [
          //Title
          InkWell(
              mouseCursor: MouseCursor.defer,
              onTap: () => context.goNamed(libraryPath, params: {
                    homePath: indexToHomePath(index: 0),
                    libraryPath: indexToLibraryPath(index: 0)
                  }),
              child: const LibraryTitleBlock()),

          //Empty Expanded Space
          Expanded(
            child: InkWell(
              mouseCursor: MouseCursor.defer,
              onTap: () => context.goNamed(libraryPath, params: {
                homePath: indexToHomePath(index: 0),
                libraryPath: indexToLibraryPath(index: 0)
              }),
              child: const SizedBox.expand(),
            ),
          ),

          //Maybe just maybe use a Dialog for this...

          ListTile(
            selected: selectedIndex == 1,
            leading: addCreateIcon,
            title: const Text('Create New Book'),
            onLongPress: () {},
            onTap: () => context.goNamed(homeSubPath, params: {
              homePath: indexToHomePath(index: 0),
              homeSubPath: indexToLibraryPath(index: 1),
            }),
          ),
          ListTile(
            selected: selectedIndex == 2,
            leading: createNewIconFolder,
            title: const Text('Create New Series'),
            onLongPress: () {},
            onTap: () => context.goNamed(homeSubPath, params: {
              homePath: indexToHomePath(index: 0),
              homeSubPath: indexToLibraryPath(index: 2),
            }),
          ),
          ListTile(
            leading: settingsIcon,
            title: const Text('Settings'),
            onTap: () => context.goNamed(homeSubPath, params: {
              homePath: indexToHomePath(index: 1),
              homeSubPath: indexToSettingsPath(index: 1),
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
