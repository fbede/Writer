import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/utils/utils.dart';

import '../../router/main_routes.dart';
import '../../router/router_paths.dart';
import 'cubit/library_cubit.dart';

class DesktopLibraryPage extends StatelessWidget {
  const DesktopLibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            //Left Section
            Container(
                width: 300,
                color: getAppBarBackgroundColor(context),
                child: Column(children: [
                  //Title
                  buildTitleBlock(context),

                  //Empty Expanded Page
                  Expanded(child: SizedBox.fromSize()),

                  //trailing
                  ListTile(
                    leading: const Icon(Icons.create_new_folder),
                    title: const Text('Create New Series'),
                    onTap: () {},
                    onLongPress: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.class_),
                    title: const Text('Create New Book'),
                    onTap: () {},
                    onLongPress: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () => context.goNamed(homePath,
                        params: {'page': indexToHomePath(index: 1)}),
                    onLongPress: () {},
                  ),
                  const SizedBox(height: 5)
                ])),

            //Right Section
            Expanded(flex: 1, child: Text('yo'))
          ],
        ),
      );

  buildTitleBlock(BuildContext context) => AspectRatio(
        aspectRatio: 1.0,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                stringLibrary,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: getAppBarForgroundColor(context)),
              ),
              const SizedBox(height: 14),
              Text(
                'Series: ${context.watch<LibraryCubit>().state.projectNum}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: getAppBarForgroundColor(context)),
              ),
              const SizedBox(height: 5),
              Text(
                'Books: ${context.watch<LibraryCubit>().state.projectNum}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: getAppBarForgroundColor(context)),
              ),
            ],
          ),
        ),
      );
}
