import 'package:flutter/material.dart';
import '../functions/settings_functions.dart';

class MobileSettingsBodyMin extends StatelessWidget {
  const MobileSettingsBodyMin({Key? key, this.index = 1}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //Theme IconButton
        IconButton(
            onPressed: () => handleTap(context, 1),
            icon: getMinThemeIcon(context, 1)),

        //AboutApp IconButton
        IconButton(
            onPressed: () => handleTap(context, 2),
            icon: Icon(
              Icons.info,
              color: colorIcon(context, 2),
            ))
      ],
    );
  }

  getMinThemeIcon(BuildContext context, int index) {
    if (this.index == index) {
      return IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
          child: getThemeIcon(context: context));
    } else {
      return getThemeIcon(context: context);
    }
  }

  colorIcon(BuildContext context, int index) {
    if (this.index == index) {
      return Theme.of(context).colorScheme.secondary;
    }
  }
}
