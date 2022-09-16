import 'package:go_router/go_router.dart';
import '../pages/pages.dart';
import 'router_functions.dart';
import 'router_paths.dart';

final mainAppRoutes = <GoRoute>[
  GoRoute(
    path: '/',
    redirect: (state) => state.namedLocation(homeSubPath, params: {
      homePath: indexToHomePath(index: 0),
      homeSubPath: indexToLibraryPath(index: 0)
    }),
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
    path: ':$homeSubPath',
    name: homeSubPath,
    builder: (context, state) => HomePage(
      key: state.pageKey,
      homeIndex: homePathToIndex(string: state.params[homePath]!),
      subRouteIndex: homeSubPathToIndex(string: state.params[homeSubPath]),
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
