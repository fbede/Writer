import 'package:go_router/go_router.dart';
import '../pages/pages.dart';
import 'router_functions.dart';
import 'router_paths.dart';

final mainAppRoutes = <GoRoute>[
  GoRoute(
    path: '/',
    redirect: (_) => '/$libraryPath',
  ),

  //used mainly by mobile so that nested navigation works
  GoRoute(
      name: homePath,
      path: '/:$homePath',
      builder: (context, state) => HomePage(
            key: state.pageKey,
            homeIndex: homePathToIndex(string: state.params[homePath]!),
          ),
      routes: homeSubRoutes),
];

final homeSubRoutes = <GoRoute>[
  GoRoute(
    path: ':$homePageSubPath',
    name: homePageSubPath,
    builder: (context, state) => HomePage(
      key: state.pageKey,
      homeIndex: homePathToIndex(string: state.params[homePath]!),
      subRouteIndex: settingsPathToIndex(string: state.params[homePageSubPath]),
    ),
    routes: [
      GoRoute(
          path: licensesPagePath,
          name: licensesPagePath,
          builder: (context, state) => const LicensesPage()),
      GoRoute(
          path: aboutAppPath,
          name: aboutAppPath,
          builder: (context, state) => const AboutAppPage())
    ],
  ),
];
