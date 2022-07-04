import 'package:flutter/material.dart';

import '../../core/responsive_page.dart';

class CreateNewBookPage extends StatelessWidget {
  final Widget mobileView = _MobileCreateNewBookPage();
  final Widget tabletView = _TabletCreateNewBookPage();

  CreateNewBookPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsivePage.buildResponsivePage(mobileView, tabletView);
  }
}

class _MobileCreateNewBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _TabletCreateNewBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
