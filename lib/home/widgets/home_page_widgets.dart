import 'package:flutter/material.dart';

import '../../utils/strings.dart';

// Home page bottom navigation bar
Widget bottomNavBar = BottomNavigationBar(items: const [
  BottomNavigationBarItem(
      icon: Icon(Icons.class_outlined),
      label: stringLibrary,
      activeIcon: Icon(Icons.class_)),
  BottomNavigationBarItem(
      icon: Icon(Icons.store_mall_directory_outlined),
      label: stringLibrary,
      activeIcon: Icon(Icons.store_mall_directory)),
  BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: stringLibrary,
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
  title: const Text(stringAppName),
);

Widget createButton = FloatingActionButton(
  onPressed: (() {}),
  tooltip: 'Increment',
  child: const Icon(Icons.add),
);
