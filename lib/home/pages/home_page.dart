import 'package:flutter/material.dart';
import 'package:writer/core/responsive_page.dart';
import '../widgets/home_page_widgets.dart';

//TODO: Add convert book to series and vice versa logic

const id = 'home_page';

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
