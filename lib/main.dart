import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home/cubits/home_page_cubit.dart';
import 'home/pages/home_page.dart';
import 'utils/color_schemes.dart';

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
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: HomePage(),
      ),
    );
  }
}
