import 'dart:io';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_size/window_size.dart';
import 'package:writer/ui/settings/cubit/settings_cubit.dart';
import 'package:writer/ui/library/cubit/library_cubit.dart';
import 'package:writer/utils/strings.dart';
import 'router/main_routes.dart';
import 'utils/color_schemes.dart';

// TODO 1b: Clean code especiallly mobile app settings. Extract widgets that would be useful for desktop view
// TODO 2: Maybe Add LanguageScreen
// TODO 3: Add OnboardingScreen
// TODO 4: Add LoginScreen
// TODO 5: Add TutorialScreen

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
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
          useMaterial3: true,
          colorScheme: lightColorScheme,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
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
        logo: Image.asset(''),
        title: Text(
          stringAppName,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: getAppBarForgroundColor(context)),
        ),
        backgroundColor: getAppBarBackgroundColor(context),
        showLoader: true,
        loadingText: const Text(''),
        futureNavigator: futureCall(),
      ),
    );
  }

  Future<Widget> futureCall() async {
    WidgetsFlutterBinding.ensureInitialized();

    //set desktop window sizing
    if (!kIsWeb) {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        //window size package is a necessary evil
        //it is not available on pub.dev but
        //it prevents the window on desktop from becoming too small
        //this would prevent users from making the window so small
        //and prevent unbounded widget error in flutter
        //can replace with another package...
        //window_manager
        setWindowTitle(stringAppName);
        setWindowMinSize(const Size(300, 300));
        setWindowMaxSize(Size.infinite);
      }
    }

    //gets SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    //initialize router
    final GoRouter router = GoRouter(
      routes: mainAppRoutes,
    );

    //starts actual app
    //displays splashscreen for 4 seconds
    return Future.delayed(const Duration(seconds: 4), ((() {
      //add necessary comments here
      return Builder(
          //This makes keyboards on touchscreen devices to automatically close
          builder: ((context) => GestureDetector(
              onTap: () {},
              child: TooltipVisibility(
                visible: false,
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => LibraryCubit(),
                    ),
                    BlocProvider(
                      create: (context) => SettingsCubit(prefs: prefs),
                    ),
                    /* BlocProvider(
                      create: (context) => TextOpacityCubit(),
                    ) */
                  ],
                  child: Builder(
                    builder: (context) {
                      //loads the current themeMode into memory (App state)
                      context.read<SettingsCubit>().getThemeMode();

                      //returns actual app
                      return MaterialApp.router(
                        title: 'Flutter Demo',
                        themeMode:
                            context.watch<SettingsCubit>().state.themeMode,
                        theme: ThemeData(
                            useMaterial3: true,
                            colorScheme: lightColorScheme,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity),
                        darkTheme: ThemeData(
                            useMaterial3: true,
                            colorScheme: darkColorScheme,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity),
                        routeInformationProvider:
                            router.routeInformationProvider,
                        routeInformationParser: router.routeInformationParser,
                        routerDelegate: router.routerDelegate,
                        debugShowCheckedModeBanner: false,
                      );
                    },
                  ),
                ),
              ))));
    })));
  }
}
