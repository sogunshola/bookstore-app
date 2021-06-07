import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'blocs/app_observer.dart';
import 'blocs/application/application_bloc.dart';
import 'blocs/theme/theme_bloc.dart';
import 'configs/app_globals.dart';
import 'configs/app_theme.dart';
import 'configs/constants.dart';
import 'configs/routes.dart';
import 'generated/l10n.dart';
import 'modules/store/cubit/book_cubit.dart';
import 'utils/app_preferences.dart';
import 'utils/internet_checker/config.dart';
import 'utils/internet_checker/internet_checker.dart';
import 'utils/localization.dart';

final GetIt getIt = GetIt.instance;

void main() {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Init service locator singletons.
  initServiceLocator();

  // Init Internet checker
  internetChecker();

  /// The App's [BlocObserver].
  Bloc.observer = AppObserver();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

/// Registers all the singletons we need by passing a factory function.
Future<void> initServiceLocator() async {
  getIt.registerLazySingleton<AppTheme>(() => AppTheme());
  getIt.registerLazySingleton<AppGlobals>(() => AppGlobals());

  final AppPreferences appPreferencesInstance =
      await AppPreferences.getInstance();
  getIt.registerSingleton<AppPreferences>(appPreferencesInstance);
}

/// Watch internet connectivity
void internetChecker() {
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  ConnectionChecker _checker = ConnectionChecker();

  globals.connectivity = _checker;
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late ThemeBloc _themeBloc;
  late ApplicationBloc _applicationBloc;
  late BookCubit _bookCubit;

  @override
  void initState() {
    /// The glue between the widgets layer and the Flutter engine.
    WidgetsBinding.instance!.addObserver(this);
    _initBlocs();
    super.initState();
  }

  void _initBlocs() {
    _themeBloc = ThemeBloc();
    globals.themeBloc = _themeBloc;

    _applicationBloc = ApplicationBloc(themeBloc: _themeBloc);
    globals.applicationBloc = _applicationBloc;

    _bookCubit = BookCubit();
    globals.bookCubit = _bookCubit;
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _themeBloc.close();
    globals.themeBloc!.close();
    _applicationBloc.close();
    globals.applicationBloc!.close();
    _bookCubit.close();
    globals.bookCubit!.close();

    super.dispose();
  }

  /// Called when the system puts the app in the background or returns the app
  /// to the foreground.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (globals.isUserOnboarded) {
      /// Notify ApplicationBloc with a new [LifecycleChangedApplicationEvent].
      _applicationBloc.add(LifecycleChangedApplicationEvent(state: state));
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      bloc: globals.applicationBloc,
      buildWhen: (previousState, currentState) =>
          (currentState is LifecycleChangeInProgressApplicationState &&
              currentState.state == AppLifecycleState.resumed) ||
          currentState is! LifecycleChangeInProgressApplicationState,
      builder: (context, state) {
        final Locale selectedLocale = globals.selectedLocale ?? kDefaultLocale;
        return BlocBuilder<ThemeBloc, ThemeState>(
          bloc: globals.themeBloc,
          builder: (context, state) {
            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ));
            return MaterialApp(
              title: 'Online Bookstore',
              theme: getIt.get<AppTheme>().lightTheme,
              darkTheme: getIt.get<AppTheme>().darkTheme,
              initialRoute: Routes.splashScreen,
              color: kPrimaryColor,
              routes: Routes().generateRoutes(context),
              locale: selectedLocale,
              supportedLocales: L10n.delegate.supportedLocales,
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                L10n.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate, // Needed for iOS!
                FallbackCupertinoLocalisationsDelegate(),
              ],
              localeResolutionCallback: (locale, supportedLocales) =>
                  selectedLocale,
              builder: (context, child) {
                return MediaQuery(
                  child: child!,
                  data: MediaQuery.of(context),
                );
              },
            );
          },
        );
      },
    );
  }
}
