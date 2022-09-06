import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../functions/settings_functions.dart';

class MobileSettingsBody extends StatelessWidget {
  const MobileSettingsBody(
      {Key? key, this.shouldShrinkWrap = false, this.index})
      : super(key: key);

  //!used by mobilepage! Dont remove.
  final bool shouldShrinkWrap;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: shouldShrinkWrap,
      children: [
        //Theme ListTile
        ListTile(
          selected: index == 1,
          leading: getThemeIcon(context: context),
          title: const Text(stringTheme),
          subtitle: getThemeSubtitle(context: context),
          onTap: () => handleTap(context, 1),
          onLongPress: () {},
        ),

        const Divider(height: 2, thickness: 2),

        //About ListTile
        ListTile(
          selected: index == 2,
          leading: const Icon(
            Icons.info,
          ),
          title: const Text(stringAboutApp),
          subtitle: const Text(stringAppVersion),
          onTap: () => handleTap(context, 2),
          onLongPress: () {},
        )
      ],
    );
  }
}
