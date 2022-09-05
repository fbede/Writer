import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/utils.dart';
import '../../router/router.dart';
import 'cubit/library_cubit.dart';

class LeftSideBar extends StatefulWidget {
  const LeftSideBar({
    Key? key,
    this.isCollapsed = false,
  }) : super(key: key);
  final bool isCollapsed;

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  late bool isCollapsed;

  @override
  void initState() {
    super.initState();
    isCollapsed = widget.isCollapsed;
  }

  @override
  void didUpdateWidget(covariant LeftSideBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    isCollapsed = widget.isCollapsed;
  }

  @override
  Widget build(BuildContext context) {
    if (isCollapsed) {
      return Container(
        width: 60,
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () => setState(() {
                        isCollapsed = !isCollapsed;
                      }),
                  icon: const Icon(Icons.menu)),
            ),

            //Empty Expanded Space
            Expanded(child: SizedBox.fromSize()),

            //Trailing icons
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.create_new_folder)),
            const SizedBox(height: 8),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            const SizedBox(height: 8),
            IconButton(
                onPressed: () => context.goNamed(homePath,
                    params: {homePath: indexToHomePath(index: 1)}),
                icon: const Icon(Icons.settings)),
            const SizedBox(height: 8),
            const SizedBox(height: 5)
          ],
        ),
      );
    }
    return Container(
        width: 300,
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(children: [
          //Title
          Stack(
            children: [
              buildTitle(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () => setState(() {
                          isCollapsed = !isCollapsed;
                        }),
                    icon: const Icon(Icons.menu)),
              ),
            ],
          ),

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

//Build title
Widget buildTitle(BuildContext context, {double opacity = 0}) {
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
              'Series: ${context.watch<LibraryCubit>().state.projectNum}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 5),
          Opacity(
            opacity: 1 - opacity,
            child: Text(
              'Books: ${context.watch<LibraryCubit>().state.projectNum}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    ),
  );
}
