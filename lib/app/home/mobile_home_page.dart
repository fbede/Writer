import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:writer/router/router_paths.dart';
import '../../utils/strings.dart';
import '../accounts/mobile_accounts_page.dart';
import '../library/mobile_library_page.dart';
import '../notes/mobile_notes_page.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: body[widget.index],
      bottomNavigationBar: _buildBottomNavigationBar(context),
    ));
  }

//list of widgets that make up the body
  final body = <Widget>[
    MobileLibraryPage(),
    MobileNotesPage(),
    MobileAccountPage()
  ];

//method creates the navigationbar
  NavigationBarTheme _buildBottomNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          height: 70,
          labelTextStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.labelLarge)),
      child: NavigationBar(
          selectedIndex: widget.index,
          onDestinationSelected: (i) => _goToPage(index: i),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.class_outlined),
                label: stringLibrary,
                selectedIcon: Icon(Icons.class_)),
            NavigationDestination(
                icon: Icon(Icons.description_outlined),
                label: stringNotes,
                selectedIcon: Icon(Icons.description)),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: stringProfile,
              selectedIcon: Icon(Icons.account_circle),
            ),
          ]),
    );
  }

//uses gorouter to open the correct tab
  _goToPage({required int index}) {
    String path = '';
    switch (index) {
      case 0:
        path = libraryPath;
        break;
      case 1:
        path = notesPath;
        break;
      case 2:
        path = profilePath;
        break;
      default:
        path = libraryPath;
    }
    context.goNamed(path);
  }
}
