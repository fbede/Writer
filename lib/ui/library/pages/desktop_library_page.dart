import 'package:flutter/material.dart';
import 'package:writer/ui/library/widgets/library_widgets.dart';

class DesktopLibraryPage extends StatelessWidget {
  const DesktopLibraryPage({Key? key, this.selectedIndex = 0})
      : super(key: key);

  final int selectedIndex;
  final List<Widget> rightSection = const [
    DesktopLibraryPageBody(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            //Left Section
            const LibrarySideBar(),

            const VerticalDivider(width: 2),

            //Right Section
            Expanded(
                child: IndexedStack(
              index: selectedIndex,
              children: rightSection,
            ))
          ],
        ),
      );
}
