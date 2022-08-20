import 'package:go_router/go_router.dart';
import '../app/home/home_page.dart';
import 'router_paths.dart';

//use this logic to prevent unauthenticated users from accessing other pages
List<GoRoute> getRoute() {
  return mainAppRoutes;
  // if (false) {
  //   return testRoute1;
  // } else {
  //   return testRoute2;
  // }
}

final mainAppRoutes = <GoRoute>[
  GoRoute(
      name: homePath,
      path: homePath,
      builder: (context, state) => const HomePage()),
  GoRoute(
      name: libraryPath,
      path: libraryPath,
      builder: (context, state) => const HomePage(
            index: 0,
          )),
  GoRoute(
      name: notesPath,
      path: notesPath,
      builder: (context, state) => const HomePage(
            index: 1,
          )),
  GoRoute(
      name: profilePath,
      path: profilePath,
      builder: (context, state) => const HomePage(
            index: 2,
          )),
];
