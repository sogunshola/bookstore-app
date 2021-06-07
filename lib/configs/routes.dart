import 'package:flutter/material.dart';

import '../modules/auth/login.dart';
import '../modules/store/screen/single_book.dart';
import '../screens/landing.dart';
import '../screens/splashscreen.dart';

class Routes {
  static const String login = '/login';
  static const String splashScreen = '/splashScreen';
  static const String landing = '/landing';
  static const String singleBook = '/singleBook';

  Map<String, Widget Function(BuildContext)> generateRoutes(
      BuildContext context) {
    return {
      splashScreen: (context) => SplashScreen(),
      login: (context) => const LoginScreen(),
      landing: (context) => const Landing(),
      singleBook: (context) => const SingleBook(),
    };
  }
}
