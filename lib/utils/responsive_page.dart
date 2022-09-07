import 'package:flutter/widgets.dart';

bool isMobile(BuildContext context) {
  if (MediaQuery.of(context).size.width < 550) {
    return true;
  }
  return false;
}

bool isTablet(BuildContext context) {
  if (MediaQuery.of(context).size.width >= 550 &&
      MediaQuery.of(context).size.width <= 1000) {
    return true;
  }
  return false;
}

bool isDesktop(BuildContext context) {
  if (MediaQuery.of(context).size.width > 1000) {
    return true;
  }
  return false;
}

Widget buildResponsivePageTwoOptions(
    {required Widget mobileLayout, required Widget desktopLayout}) {
  return LayoutBuilder(builder: (context, constraints) {
    if (isMobile(context)) {
      return mobileLayout;
    } else {
      return desktopLayout;
    }
  });
}

Widget buildResponsivePageThreeOptions(
    {required Widget mobileLayout,
    required Widget tabletLayout,
    required Widget desktopLayout}) {
  return LayoutBuilder(builder: (context, constraints) {
    if (isMobile(context)) {
      return mobileLayout;
    }
    if (isTablet(context)) {
      return tabletLayout;
    }
    return desktopLayout;
  });
}

// determines whether the width of the sidebars
double getSideBarWidth(BuildContext context) {
  double fixedWidth = 300;
  double w = MediaQuery.of(context).size.width * 2 / 5;
  if (w > fixedWidth) {
    return fixedWidth;
  }
  return w;
}
