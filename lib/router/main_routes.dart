import 'package:go_router/go_router.dart';
import 'package:writer/ui/app_settings/pages/select_theme_page.dart';
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
      builder: (context, state) {
        return HomePage(
          key: state.pageKey,
          index: homePathToIndex(string: state.params['page']!),
        );
      },
      routes: settingsRoutes),
];

final settingsRoutes = <GoRoute>[
  GoRoute(
      name: selectThemePath,
      path: selectThemePath,
      builder: (context, state) => const SelectThemePage())
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
