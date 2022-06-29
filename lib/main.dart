import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'home/home_page.dart';

/*
 * THINGS TO DO
 * TODO: Add SplashScreen
 * TODO: Add OnboardingScreen
 * TODO: Add LoginScreen
 * TODO: Add TutorialScreen
 * TODO: Add HomeScreen
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //Todo: Modify Theme Information Later
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
