import 'package:flutter/material.dart';
import 'package:writer/home/pages/home_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case '/createNewBook':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case '/createNewSeries':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
    }
  }
}
