import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../blocs/application/application_bloc.dart';
import '../blocs/theme/theme_bloc.dart';
import '../main.dart';
import '../modules/store/book_model.dart';
import '../modules/store/cubit/book_cubit.dart';
import '../utils/internet_checker/internet_checker.dart';
import 'app_theme.dart';

/// Class to store runtime global settings.
class AppGlobals {
  factory AppGlobals() => instance;

  AppGlobals._();

  /// Singleton instance.
  static final AppGlobals instance = AppGlobals._();

  /// [GlobalKey] for our bottom bar.
  GlobalKey? globalKeyBottomBar;

  /// [GlobalKey] for internet connectivity
  ConnectionChecker? connectivity;

  /// [GlobalKey] for our [HomeScreen].
  GlobalKey? globalKeyHomeScreen;

  /// [GlobalKey] for our [SearchScreen].
  GlobalKey? globalKeySearchScreen;

  /// [GlobalKey] for tab bar in [SearchScreen].
  GlobalKey? globalKeySearchTabs;

  /// Dark Theme option
  DarkOption darkThemeOption = DarkOption.dynamic;

  /// Logged in user data.
  // UserModel user;

  /// Authentication token
  String? token;

  /// Currently selected [Locale].
  Locale? selectedLocale;

  /// Is user onbaorded or this is their first run?
  bool isUserOnboarded = false;

  /// App is running on emulator (or real device)?
  bool? isEmulator;

  /// Is the current locale RTL?
  bool? isRTL;

  ///Themebloc instance
  ThemeBloc? themeBloc;

  ///Themebloc instance
  ApplicationBloc? applicationBloc;

  ///Bookcubit instance
  BookCubit? bookCubit;

  ///Bookmarked books
  List<Book> bookmarks = [];

  /// The current brightness mode of the host platform.
  Brightness get getPlatformBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;

  /// Is the current brightness mode of the host platform dark?
  bool get isPlatformBrightnessDark {
    switch (darkThemeOption) {
      case DarkOption.alwaysOff:
        return false;
        break;
      case DarkOption.alwaysOn:
        return true;
      default:
        return Brightness.dark == getPlatformBrightness;
    }
  }
}

AppGlobals globals = getIt.get<AppGlobals>();
