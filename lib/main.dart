import 'dart:io';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:window_size/window_size.dart';
import 'package:writer/router/app_router.dart';
import 'package:writer/utils/strings.dart';
import 'utils/color_schemes.dart';

// TODO 1: Add SplashScreen
// TODO: Maybe Add LanguageScreen
// TODO 2: Add OnboardingScreen
// TODO 3: Add LoginScreen
// TODO 4: Add TutorialScreen
// TODO 5: Add HomeScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //shows splashscreen
      home: const SplashPage(),
      //check constants.dart file for details
      title: stringAppName,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          colorScheme: lightColorScheme,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

//builds the SplashScreen Page
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: EasySplashScreen(
        logo: Image.asset('assets/flutter_joke.png'),
        title: Text(
          stringAppName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        showLoader: true,
        loadingText: const Text("Loading..."),
        futureNavigator: futureCall(),
      ),
    );
  }

  Future<Widget> futureCall() async {
    WidgetsFlutterBinding.ensureInitialized();

    //set desktop window sizing
    if (!kIsWeb) {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        setWindowTitle(stringAppName);
        setWindowMinSize(const Size(300, 300));
        setWindowMaxSize(Size.infinite);
      }
    }

    //initialize router
    final GoRouter router = GoRouter(
      routes: mainAppRoutes,
      //based on firebase auth
      /* redirect: (state) => NavRules.userLoggedInRule(state) */
    );

    //starts actual app
    return Future.delayed(const Duration(seconds: 4), ((() {
      //add necessary comments here
      return Builder(
          builder: ((context) => GestureDetector(
                onTap: () {},
                child: TooltipVisibility(
                  visible: false,
                  child: MaterialApp.router(
                      routeInformationProvider: router.routeInformationProvider,
                      routeInformationParser: router.routeInformationParser,
                      routerDelegate: router.routerDelegate),
                ),
              )));
    })));
  }
}
