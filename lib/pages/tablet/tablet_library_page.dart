import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class TabletLibraryPage extends StatelessWidget {
  const TabletLibraryPage({Key? key, this.selectedIndex = 0}) : super(key: key);

  final int selectedIndex;
  final List<Widget> rightSection = const [
    TabletLibraryPageBody(),
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
