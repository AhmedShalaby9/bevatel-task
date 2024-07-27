import 'package:bevatel_task/common/helper/navigation/routes.dart';
import 'package:bevatel_task/features/chat/presenttion/view/screens/chats_screen.dart';
import 'package:bevatel_task/features/travels/domain/model/travel_model.dart';
import 'package:flutter/material.dart';
import '../../../features/auth/presentation/view/screens/login_screen.dart';
import '../../../features/auth/presentation/view/screens/signup_screen.dart';
import '../../../features/chat/presenttion/view/screens/chat_details_screen.dart';
import '../../../features/onboarding/presentation/view/screens/splash_screen.dart';
import '../../../features/travels/presentation/view/screens/add_travel_screen.dart';
import '../../../features/travels/presentation/view/screens/travels_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case AppRoutes.loginScreen:
      return MaterialPageRoute(builder: (context) => const LoginScreen());

    case AppRoutes.signupScreen:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());

    case AppRoutes.travelsScreen:
      return MaterialPageRoute(builder: (context) => const TravelsScreen());

    case AppRoutes.addEditTravelScreen:
      return MaterialPageRoute(
          builder: (context) =>
              AddEditTravelScreen(travel: settings.arguments as TravelModel?));
    case AppRoutes.chatDetailsScreen:
      return MaterialPageRoute(builder: (context) => const ChatDetailsScreen());
    case AppRoutes.chatScreen:
      return MaterialPageRoute(builder: (context) => const ChatsScreen());

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text("no path for ${settings.name}"),
                ),
              ));
  }
}
