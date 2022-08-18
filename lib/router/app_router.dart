import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import '../app/home.dart';
// import '../auth/pages/auth_pages.dart';

const String splashPath = '/splash';
const String onboardingPath = '/onboarding';
const String logInPath = '/logIn';
const String signUpPath = '/signUp';
const String homePath = '/';
const String passwordResetPath = '/resetPassword';
const String dashboardPath = '/dashboard';
const String accountsPath = '/accounts';
const String reportsPath = '/reports';
const String settingsPath = '/settings';

//use this logic to prevent unauthenticated users from accessing other pages
// getRoute() {
//   if (false) {
//     return testRoute1;
//   } else {
//     return testRoute2;
//   }
// }

final mainAppRoutes = <GoRoute>[
  GoRoute(
      name: homePath,
      path: homePath,
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('true'))))
];

/* final appMainRoutes = <GoRoute>[
  GoRoute(
    name: homePath,
    path: homePath,
    builder: (BuildContext context, GoRouterState state) {
      return const HomePage();
    },
  ),
  GoRoute(
    name: logInPath,
    path: logInPath,
    builder: (BuildContext context, GoRouterState state) {
      return const LogInPage();
    },
  ),
  GoRoute(
    name: signUpPath,
    path: signUpPath,
    builder: (BuildContext context, GoRouterState state) {
      return const SignUpPage();
    },
  ),
  GoRoute(
    name: passwordResetPath,
    path: passwordResetPath,
    builder: (BuildContext context, GoRouterState state) {
      return const PasswordResetPage();
    },
  ),
  GoRoute(
    name: dashboardPath,
    path: dashboardPath,
    builder: (context, state) {
      return const HomePage(pageIndex: 0);
    },
  ),
  GoRoute(
    name: accountsPath,
    path: accountsPath,
    builder: (context, state) {
      return const HomePage(pageIndex: 1);
    },
  ),
  //index 2 was skipped because it is null
  GoRoute(
    name: reportsPath,
    path: reportsPath,
    builder: (context, state) {
      return const HomePage(pageIndex: 3);
    },
  ),
  GoRoute(
    name: settingsPath,
    path: settingsPath,
    builder: (context, state) {
      return const HomePage(pageIndex: 4);
    },
  ),
];
 */