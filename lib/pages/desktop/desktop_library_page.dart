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
  }) : super(key: key);

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

          ListTile(
<<<<<<<< HEAD:lib/pages/desktop/desktop_library_page.dart
            leading: createNewIconFolder,
========
            leading: const Icon(newFolderIcon),
>>>>>>>> a5a67d0e99019030ba4222a5784d39ad57ed7852:lib/widgets/library/library_side_bar.dart
            title: const Text('Create New Series'),
            onTap: () {},
            onLongPress: () {},
          ),
          ListTile(
<<<<<<<< HEAD:lib/pages/desktop/desktop_library_page.dart
            leading: addCreateIcon,
========
            leading: const Icon(plusOpenIcon),
>>>>>>>> a5a67d0e99019030ba4222a5784d39ad57ed7852:lib/widgets/library/library_side_bar.dart
            title: const Text('Create New Book'),
            onTap: () {},
            onLongPress: () {},
          ),
          ListTile(
<<<<<<<< HEAD:lib/pages/desktop/desktop_library_page.dart
            leading: settingsIcon,
            title: const Text('Settings'),
            onTap: () => context.goNamed(homeSubPath, params: {
              homePath: indexToHomePath(index: 1),
              homeSubPath: indexToSettingsPath(index: 1)
========
            leading: const Icon(activeSettingsIcon),
            title: const Text('Settings'),
            onTap: () => context.goNamed(settingsPath, params: {
              homePath: indexToHomePath(index: 1),
              settingsPath: indexToSettingsPath(index: 1)
>>>>>>>> a5a67d0e99019030ba4222a5784d39ad57ed7852:lib/widgets/library/library_side_bar.dart
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
