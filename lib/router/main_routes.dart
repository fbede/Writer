import 'package:go_router/go_router.dart';
import 'package:writer/utils/utils.dart';
import '../ui/home/home_page.dart';
import 'router_paths.dart';

final mainAppRoutes = <GoRoute>[
  GoRoute(
    path: '/',
    redirect: (_) => '/$libraryPath',
  ),
  GoRoute(
      name: homePath,
      path: '/:page',
      builder: (context, state) => HomePage(
            key: state.pageKey,
            index: homePathToIndex(string: state.params['page']!),
          ),
      routes: settingsRoutes),
];

final settingsRoutes = <GoRoute>[
  GoRoute(
    path: stringAboutApp,
    name: stringAboutApp,
    builder: (context, state) => HomePage(
      key: state.pageKey,
      index: homePathToIndex(string: state.params['page']!),
    ),
  )
];

int homePathToIndex({String? string}) {
  switch (string) {
    case libraryPath:
      return 0;
    case settingsPath:
      return 1;
    default:
      return 0;
  }
}

String indexToHomePath({required int index}) {
  switch (index) {
    case 0:
      return libraryPath;
    case 1:
      return settingsPath;
    default:
      return libraryPath;
  }
}
