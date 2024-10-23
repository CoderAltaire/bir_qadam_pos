import 'package:flutter/material.dart';

import 'app_route_name.dart';

class AppRouter {
  AppRouter._();

  static String? _routeName = '/';
  static String? get routeName => _routeName;
  static void setRoute() => _routeName = '/';

  static Route? onGenerateRoute(RouteSettings settings) {
    _routeName = settings.name;
    Object? args = settings.arguments;

    switch (settings.name) {
      // case RouteNames.initial:
      //   return _route(const SplashScreen());
      // case RouteNames.myaddress:
      //   return _route(MyAddressScreen(isAdd: args.toString()));


      // case RouteNames.test:
      //   return _route(const TestScreen());

      default:
        return null;
    }
  }

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
