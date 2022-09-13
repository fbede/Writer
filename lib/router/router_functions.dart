import 'router_paths.dart';

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

int homeSubPathToIndex({String? string}) {
  switch (string) {
    case selectThemePath:
      return 1;
    case aboutAppPath:
      return 2;
    default:
      return 0;
  }
}

String indexToSettingsPath({required int index}) {
  switch (index) {
    case 1:
      return selectThemePath;
    case 2:
      return aboutAppPath;
    default:
      return '';
  }
}

int libraryPathToIndex({String? string}) {
  switch (string) {
    case createEditBookPath:
      return 1;
    case createEditSeriesPath:
      return 2;
    default:
      return 0;
  }
}

String indexToLibraryPath({required int index}) {
  switch (index) {
    case 1:
      return createEditBookPath;
    case 2:
      return createEditSeriesPath;
    default:
      return '';
  }
}
