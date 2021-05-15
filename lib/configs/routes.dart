import 'package:flutter/material.dart';
import '../screens/splashscreen.dart';

class Routes {
  static const String onBoarding = '/onBoarding';
  static const String splashScreen = '/splashScreen';

  Map<String, Widget Function(BuildContext)> generateRoutes(
      BuildContext context) {
    return {
      splashScreen: (context) => SplashScreen(),
      onBoarding: (context) => Container(),
    };
  }
}
