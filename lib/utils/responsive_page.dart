import 'package:flutter/widgets.dart';

Widget buildResponsivePage(
    {required Widget mobileLayout, required Widget desktopLayout}) {
  return LayoutBuilder(builder: (context, constraints) {
    // ? Maybe Finetune Responsivness Later
    var aspectRatio = (MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height));
    if ((constraints.maxWidth > 400) && (aspectRatio >= 0.6)) {
      return desktopLayout;
    } else {
      return mobileLayout;
    }
  });
}
