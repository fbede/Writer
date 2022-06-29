import 'package:flutter/material.dart';
import 'home/pages/home_page.dart';

//
// TODO 1: Add SplashScreen
// TODO: Maybe Add LanguageScreen
// TODO 2: Add OnboardingScreen
// TODO 3: Add LoginScreen
// TODO 4: Add TutorialScreen
// TODO 5: Add HomeScreen
//

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
