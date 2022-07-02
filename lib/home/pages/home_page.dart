import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:writer/core/responsive_page.dart';
import 'package:writer/home/cubits/home_page_cubit.dart';
import 'package:writer/home/widgets/home_page_widgets.dart';
import 'package:writer/utils/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: Add convert book to series and vice versa logic

class HomePage extends StatelessWidget {
  final Widget mobileView = const _MobileHomePage();
  final Widget tabletView = _TabletHomePage();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsivePage.buildResponsivePage(mobileView, mobileView);
  }
}

class _MobileHomePage extends StatelessWidget {
  const _MobileHomePage({Key? key}) : super(key: key);

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
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.7,
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
              // TODO: Modify to look similar to mum's phone

              SliverAppBar(
                pinned: true,
                title: BlocBuilder<HomePageCubit, double>(
                  builder: (context, state) {
                    return Opacity(
                        opacity: state, child: const Text(stringLibrary));
                  },
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.green,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  color: Colors.green,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  color: Colors.green,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: createButton,
        bottomNavigationBar: bottomNavBar,
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
