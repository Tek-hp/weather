import 'package:flutter/material.dart';
import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/screens/dashboard/dashboard_view.dart';
import 'package:weather_app/screens/startup_page/startup_page_view.dart';

Route<dynamic> generateRoute(
    RouteSettings settings, Map<String, Widget> routesAndViews) {
  switch (settings.name) {
    case StartUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartupView(),
      );
    case DashBoardViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DashboardView(),
      );
    default:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartupView(),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
