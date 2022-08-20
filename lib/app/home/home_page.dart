//This file determines what version of the page to display
import 'package:flutter/material.dart';
import 'package:writer/app/home/mobile_home_page.dart';
import 'package:writer/utils/responsive_page.dart';

class HomePage extends StatelessWidget {
  final int index;
  const HomePage({Key? key, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildResponsivePage(
        mobileLayout: MobileHomePage(index: index),
        desktopLayout: MobileHomePage(index: index));
  }
}
