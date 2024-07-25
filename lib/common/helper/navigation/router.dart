import 'package:bevatel_task/common/helper/navigation/routes.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/presentation/view/screens/login_screen.dart';
import '../../../features/auth/presentation/view/screens/signup_screen.dart';
import '../../../features/onboarding/presentation/view/screens/splash_screen.dart';

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
    case AppRoutes.signupScreen:
      return MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
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
