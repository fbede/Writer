import 'package:flutter/material.dart';
import 'package:writer/core/responsive_page.dart';
import 'package:writer/home/widgets/home_page_widgets.dart';

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
    return Scaffold(
      appBar: homeAppBar,
      body: homeGridView,
      floatingActionButton: createButton,
      bottomNavigationBar: bottomNavBar,
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
