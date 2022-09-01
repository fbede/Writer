import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import 'library_widgets.dart';

class DesktopLibraryPage extends StatelessWidget {
  const DesktopLibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            //Left Section
            LeftSideBar(isCollapsed: shouldCollapse(context)),

            const VerticalDivider(width: 2),

            //Right Section
            //TODO: Implement Desktop Right Section
            const Expanded(child: Text('yo'))
          ],
        ),
      );
}
