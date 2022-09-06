import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../widgets/library_side_bar.dart';

class DesktopLibraryPage extends StatelessWidget {
  const DesktopLibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            //Left Section
            LibrarySideBar(isCollapsed: shouldCollapse(context, false)),

            const VerticalDivider(width: 2),

            //Right Section
            //TODO: Implement Desktop Right Section
            const Expanded(child: Scaffold())
          ],
        ),
      );
}
