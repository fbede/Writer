// Home page bottom navigation bar
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../utils/strings.dart';
import '../cubits/home_page_cubit.dart';
import '../pages/home_page.dart';

class HomePageNavigationBar extends StatelessWidget {
  const HomePageNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
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
          backgroundColor: Colors.blue),
    ]);
  }
}

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

//homepagebody
class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
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
                      // buildWhen: (previous, current) {
                      //  return previous.opacity != current.opacity;
                      //},
                      builder: (context, state) {
                        return Opacity(
                          opacity: 1 - state.opacity,
                          child: Text(
                            stringLibraryTitle,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    BlocBuilder<HomePageCubit, HomePageState>(
                      //buildWhen: (previous, current) {
                      //  return previous.opacity != current.opacity;
                      //},
                      builder: (context, state) {
                        return Opacity(
                            opacity: 1 - state.opacity,
                            child: Text(
                              'Books ${state.books}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ));
                      },
                    ),
                    const SizedBox(height: 5),
                    BlocBuilder<HomePageCubit, HomePageState>(
                      // buildWhen: (previous, current) {
                      //  return previous.opacity != current.opacity;
                      //},
                      builder: (context, state) {
                        return Opacity(
                          opacity: 1.0 - state.opacity,
                          child: Text('Series ${state.series}',
                              style: Theme.of(context).textTheme.titleMedium),
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
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: 70,
                  );
                }),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120))
          ],
        ));
  }
}
