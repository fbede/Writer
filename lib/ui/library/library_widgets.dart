import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:writer/ui/library/cubit/library_cubit.dart';
import '../../utils/strings.dart';

//Provides the title block
class LibraryTitleBlock extends StatelessWidget {
  final double opacity;
  const LibraryTitleBlock({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: MediaQuery.of(context).size.width * 0.6,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Opacity(
              opacity: 1 - opacity,
              child: Text(
                stringLibrary,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const SizedBox(height: 14),
            BlocBuilder<LibraryCubit, LibraryState>(
              builder: (context, state) {
                return Opacity(
                    opacity: 1 - opacity,
                    child: Text(
                      'Books ${state.projectList.length}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ));
              },
            ),
            const SizedBox(height: 5),
            BlocBuilder<LibraryCubit, LibraryState>(
              builder: (context, state) {
                return Opacity(
                  opacity: 1.0 - opacity,
                  child: Text('Series ${state.projectList.length}',
                      style: Theme.of(context).textTheme.titleMedium),
                );
              },
            )
          ])),
    );
  }
}

//Actual AppBar
class LibraryAppBar extends StatelessWidget {
  final double opacity;
  const LibraryAppBar({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        pinned: true,
        title: Opacity(
            opacity: opacity,
            child: Text(stringLibrary,
                style: Theme.of(context).textTheme.titleLarge)));
  }
}
