import 'package:go_router/go_router.dart';
import 'package:writer/ui/settings/pages/about_us_page.dart';
import 'package:writer/ui/settings/pages/licenses_page.dart';
import '../ui/home/home_page.dart';
import 'router_functions.dart';
import 'router_paths.dart';

final mainAppRoutes = <GoRoute>[
  GoRoute(
    path: '/',
    redirect: (_) => '/$libraryPath',
  ),
  GoRoute(
      name: homePath,
      path: '/:$homePath',
      builder: (context, state) => HomePage(
            key: state.pageKey,
            homeIndex: homePathToIndex(string: state.params[homePath]!),
          ),
      routes: settingsRoutes),
];

final settingsRoutes = <GoRoute>[
  GoRoute(
    path: ':$settingsPath',
    name: settingsPath,
    builder: (context, state) => HomePage(
      key: state.pageKey,
      homeIndex: homePathToIndex(string: state.params[homePath]!),
      settingsIndex: settingsPathToIndex(string: state.params[settingsPath]),
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
