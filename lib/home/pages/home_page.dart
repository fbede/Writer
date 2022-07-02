import 'package:flutter/material.dart';
import 'package:writer/core/responsive_page.dart';
import 'package:writer/home/cubits/home_page_cubit.dart';
import 'package:writer/utils/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

//TODO: Add convert book to series and vice versa logic

class HomePage extends StatelessWidget {
  final Widget mobileView = const _MobileHomePage();
  final Widget tabletView = _TabletHomePage();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsivePage.buildResponsivePage(mobileView, tabletView);
  }
}

class _MobileHomePage extends StatelessWidget {
  const _MobileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomePageBody(),
        floatingActionButton: HomePageFloatingActionButton(),
        bottomNavigationBar: HomePageNavigationBar(),
      ),
    );
  }
}

//TODO: Implement Tablet Layout
class _TabletHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// Home page bottom navigation bar
class HomePageNavigationBar extends StatelessWidget {
  const HomePageNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.class_outlined),
          label: stringLibrary,
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
              // TODO: Add Implementation Later
            }),
        SpeedDialChild(
            child: const Icon(Icons.folder),
            label: stringCreateNewSeries,
            onTap: () {
              // TODO: Add Implementation Later
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
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.5,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<HomePageCubit, double>(
                      builder: (context, state) {
                        return Opacity(
                          opacity: 1 - state,
                          child: const Text(
                            stringLibrary,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    BlocBuilder<HomePageCubit, double>(
                      builder: (context, state) {
                        return Opacity(
                          opacity: 1 - state,
                          child: const Text('Books 3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        );
                      },
                    ),
                    const SizedBox(height: 5),
                    BlocBuilder<HomePageCubit, double>(
                      builder: (context, state) {
                        return Opacity(
                          opacity: 1.0 - state,
                          child: const Text('Series 4',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              title: BlocBuilder<HomePageCubit, double>(
                builder: (context, state) {
                  return Opacity(
                      opacity: state, child: const Text(stringLibrary));
                },
              ),
            ),
          ],
        ));
  }
}
