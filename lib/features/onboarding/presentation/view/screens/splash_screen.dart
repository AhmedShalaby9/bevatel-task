import 'dart:async';
import 'package:bevatel_task/common/constants/image_paths.dart';
import 'package:bevatel_task/common/helper/navigation/navigation.dart';
import 'package:bevatel_task/common/helper/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn) {
        Navigation().navigateAndRemoveUntil(routeName: AppRoutes.travelsScreen);
      } else {
        Navigation().navigateAndRemoveUntil(routeName: AppRoutes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset(ImagePaths.splashIcon)),
    );
  }
}
