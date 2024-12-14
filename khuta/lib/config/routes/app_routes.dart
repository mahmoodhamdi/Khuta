import 'package:flutter/material.dart';
import 'package:khuta/main.dart';
import '../../core/utils/app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => MyHomePage(title: "",), // Replace with Splash Screen
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => Container(), // Replace with Login Screen
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => Container(), // Replace with Register Screen
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => Container(), // Replace with Home Screen
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
