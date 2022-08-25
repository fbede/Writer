import 'package:flutter/widgets.dart';

Widget buildResponsivePage(
    {required Widget mobileLayout, required Widget desktopLayout}) {
  return LayoutBuilder(builder: (context, constraints) {
    // ? Maybe Finetune Responsivness Later
    var aspectRatio = (MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height));
    if ((MediaQuery.of(context).size.width > 400) && (aspectRatio >= 0.8)) {
      return desktopLayout;
    } else {
      return mobileLayout;
    }
  });
}
