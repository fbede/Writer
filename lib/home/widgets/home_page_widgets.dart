import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../utils/strings.dart';

// Home page bottom navigation bar
Widget bottomNavBar = BottomNavigationBar(items: const [
  BottomNavigationBarItem(
      icon: Icon(Icons.class_outlined),
      label: stringLibrary,
      activeIcon: Icon(Icons.class_)),
  BottomNavigationBarItem(
      icon: Icon(Icons.store_mall_directory_outlined),
      label: stringStore,
      activeIcon: Icon(Icons.store_mall_directory)),
  BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: stringProfile,
      activeIcon: Icon(Icons.account_circle),
      backgroundColor: Colors.blue),
]);

//Library GridView
Widget homeGridView = GridView(
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 150, childAspectRatio: 0.6),
  children: [
    Container(
      margin: const EdgeInsets.all(10),
      color: Colors.green,
    ),
    Container(
      margin: const EdgeInsets.all(10),
      color: Colors.green,
    ),
    Container(
      margin: const EdgeInsets.all(10),
      color: Colors.green,
    ),
    Container(
      margin: const EdgeInsets.all(10),
      color: Colors.green,
    ),
  ],
);

//home AppBar
PreferredSizeWidget homeAppBar = AppBar(
  title: const Text(stringLibrary),
);

//SpeedDial or FloatingActionButton
Widget createButton = SpeedDial(
  animationDuration: const Duration(milliseconds: 250),
  animatedIcon: AnimatedIcons.menu_close,
  overlayOpacity: 0,
  spacing: 12,
  spaceBetweenChildren: 12,
  children: [
    SpeedDialChild(
        child: const Icon(Icons.book),
        label: stringCreateNewBook,
        onTap: () {
          // TODO: Add Implementation Later
        }),
    SpeedDialChild(
        child: const Icon(Icons.folder),
        label: stringCreateNewSeries,
        onTap: () {
          // TODO: Add Implementation Later
        })
  ],
);

Widget homePageBody3 = const Center(
  child: Text('Hello'),
);

// ! Error not working as supposed to
//Widget homePageBody = LayoutBuilder(builder: ((context, constraints) {
 // return 
//}));
