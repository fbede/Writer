import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/strings.dart';
import '../cubits/home_page_cubit.dart';
import '../widgets/home_page_widgets.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener(
            onNotification: (ScrollMetricsNotification notification) {
              context
                  .read<HomePageCubit>()
                  .handleNotification(context, notification);
              return true;
            },
            child: CustomScrollView(
              slivers: [
                //First AppBar (Hidden)
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),

                //Title Page
                SliverToBoxAdapter(
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<HomePageCubit, HomePageState>(
                          buildWhen: (previous, current) {
                            return previous.opacity != current.opacity;
                          },
                          builder: (context, state) {
                            return Opacity(
                              opacity: 1 - state.opacity,
                              child: Text(
                                stringLibraryTitle,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 14),
                        BlocBuilder<HomePageCubit, HomePageState>(
                          builder: (context, state) {
                            return Opacity(
                                opacity: 1 - state.opacity,
                                child: Text(
                                  'Books ${state.books}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ));
                          },
                        ),
                        const SizedBox(height: 5),
                        BlocBuilder<HomePageCubit, HomePageState>(
                          builder: (context, state) {
                            return Opacity(
                              opacity: 1.0 - state.opacity,
                              child: Text('Series ${state.series}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),

                //Actual AppBar
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  pinned: true,
                  title: BlocBuilder<HomePageCubit, HomePageState>(
                    buildWhen: (previous, current) {
                      return previous.opacity != current.opacity;
                    },
                    builder: (context, state) {
                      return Opacity(
                          opacity: state.opacity,
                          child: Text(stringLibraryTitle,
                              style: Theme.of(context).textTheme.titleLarge));
                    },
                  ),
                ),

                //Grid or BookView
                const ProjectGridView(),
              ],
            )),

        //FAB
        floatingActionButton: const HomePageFloatingActionButton(),

        //bottom Nav Bar
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.class_outlined),
                  label: stringLibraryTitle,
                  activeIcon: Icon(Icons.class_)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.store_mall_directory_outlined),
                  label: stringStore,
                  activeIcon: Icon(Icons.store_mall_directory)),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: stringProfile,
                activeIcon: Icon(Icons.account_circle),
              ),
            ]),
      ),
    );
  }
}
