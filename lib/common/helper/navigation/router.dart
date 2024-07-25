import 'package:bevatel_task/common/helper/navigation/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashScreen:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

    case AppRoutes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text("no path for ${settings.name}"),
                ),
              ));
  }
}
