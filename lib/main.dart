import 'dart:io';
import 'package:window_manager/window_manager.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubits/cubits.dart';
import 'router/main_routes.dart';
import 'utils/utils.dart';
import 'package:flutter/services.dart';

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
      theme: lightThemeData,
      darkTheme: darkThemeData,
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
        logo: Image.asset('lib/assets/logo.png'),
        title: Text(
          stringAppName,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: Theme.of(context).appBarTheme.foregroundColor),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor as Color,
        showLoader: true,
        loadingText: const Text(''),
        futureNavigator: futureCall(),
      ),
    );
  }

  Future<Widget> futureCall() async {
    WidgetsFlutterBinding.ensureInitialized();

    //locks app to portrait
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    //set desktop window sizing
    if (!kIsWeb) {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        //window_manager is in beta expect issues
        await windowManager.ensureInitialized();

        WindowOptions windowOptions = WindowOptions(
          minimumSize: const Size(300, 600),
          alwaysOnTop: isAlwaysOnTop(),
          skipTaskbar: false,
          title: stringAppName,
        );
        windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.show();
          await windowManager.focus();
        });
      }
    }

    //gets SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    //initialize router
    final GoRouter router = GoRouter(
      routes: mainAppRoutes,
    );

    //starts services
    //SettingsService();

    //starts actual app
    //displays splashscreen for 4 seconds
    return Future.delayed(
      const Duration(seconds: 4),
      ((() {
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
                        //returns actual app
                        return MaterialApp.router(
                          title: 'Flutter Demo',
                          themeMode:
                              context.watch<SettingsCubit>().state.themeMode,
                          theme: lightThemeData,
                          darkTheme: darkThemeData,
                          routeInformationProvider:
                              router.routeInformationProvider,
                          routeInformationParser: router.routeInformationParser,
                          routerDelegate: router.routerDelegate,
                          debugShowCheckedModeBanner: false,
                        );
                      },
                    ),
                  ),
                ),
              )),
        );
      })),
    );
  }

  //keeps the app always on top in debug mode
  isAlwaysOnTop() {
    if (kDebugMode) {
      return true;
    }
    return false;
  }
}
