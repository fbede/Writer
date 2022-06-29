import 'package:flutter/widgets.dart';

// Made abstract to prevent creating an instance
abstract class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  static Widget buildResponsivePage(Widget mobileLayout, Widget tabLayout) {
    return LayoutBuilder(builder: (context, constraints) {
      // ? Maybe Finetune Responsivness Later
      var aspectRatio = (MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height));
      if ((constraints.maxWidth > 400) && (aspectRatio >= 0.6)) {
        return tabLayout;
      } else {
        return mobileLayout;
      }
    });
  }
}
