import 'package:flutter/material.dart';
import 'package:writer/ui/library/widgets/library_widgets.dart';
import '../../../utils/utils.dart';

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
            //TODO: Add padding to the top & bottom of library page body
            Expanded(
                child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: false),
              body: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: LibraryPageBody(
                  shouldShrinkWrap: false,
                ),
              ),
            ))
          ],
        ),
      );
}
