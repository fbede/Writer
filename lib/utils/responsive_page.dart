import 'package:flutter/widgets.dart';

Widget buildResponsivePage(
    {required Widget mobileLayout, required Widget desktopLayout}) {
  return LayoutBuilder(builder: (context, constraints) {
    if (isMobile(context)) {
      return mobileLayout;
    } else {
      return desktopLayout;
    }
  });
}

bool isMobile(BuildContext context) {
  // ? Maybe Finetune Responsivness Later
  var aspectRatio = (MediaQuery.of(context).size.width /
      (MediaQuery.of(context).size.height));
  if ((MediaQuery.of(context).size.width > 350) && (aspectRatio >= 0.65)) {
    return false;
  } else {
    return true;
  }
}

//determines if sidebars should automatically collapse
bool shouldCollapse(BuildContext context) {
  if (MediaQuery.of(context).size.width <= 750) {
    return true;
  } else {
    return false;
  }
}
