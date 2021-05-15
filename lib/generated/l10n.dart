// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class L10n {
  L10n();
  
  static L10n current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      L10n.current = L10n();
      
      return L10n.current;
    });
  } 

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `FLUTTER BOILER PLATE BY SHALOMCODES`
  String get commonBoilerPlateText {
    return Intl.message(
      'FLUTTER BOILER PLATE BY SHALOMCODES',
      name: 'commonBoilerPlateText',
      desc: '',
      args: [],
    );
  }

  /// `in 1 day, {hours} hours`
  String commonElapsedDayHours(Object hours) {
    return Intl.message(
      'in 1 day, $hours hours',
      name: 'commonElapsedDayHours',
      desc: '',
      args: [hours],
    );
  }

  /// `in {days} days`
  String commonElapsedDays(Object days) {
    return Intl.message(
      'in $days days',
      name: 'commonElapsedDays',
      desc: '',
      args: [days],
    );
  }

  /// `in 1 hour, {mins} mins`
  String commonElapseHhourMins(Object mins) {
    return Intl.message(
      'in 1 hour, $mins mins',
      name: 'commonElapseHhourMins',
      desc: '',
      args: [mins],
    );
  }

  /// `in {hours} hours`
  String commonElapsedHours(Object hours) {
    return Intl.message(
      'in $hours hours',
      name: 'commonElapsedHours',
      desc: '',
      args: [hours],
    );
  }

  /// `in {mins} mins`
  String commonElapsedMins(Object mins) {
    return Intl.message(
      'in $mins mins',
      name: 'commonElapsedMins',
      desc: '',
      args: [mins],
    );
  }

  /// `in process`
  String get commonElapsedNow {
    return Intl.message(
      'in process',
      name: 'commonElapsedNow',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get commonBtnOk {
    return Intl.message(
      'Ok',
      name: 'commonBtnOk',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get commonBtnCancel {
    return Intl.message(
      'Cancel',
      name: 'commonBtnCancel',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get commonBtnApply {
    return Intl.message(
      'Apply',
      name: 'commonBtnApply',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get commonBtnClose {
    return Intl.message(
      'Close',
      name: 'commonBtnClose',
      desc: '',
      args: [],
    );
  }

  /// `Pull down to refresh`
  String get commonSmartRefresherHeaderIdleText {
    return Intl.message(
      'Pull down to refresh',
      name: 'commonSmartRefresherHeaderIdleText',
      desc: '',
      args: [],
    );
  }

  /// `Refreshing...`
  String get commonSmartRefresherHeaderRefreshingText {
    return Intl.message(
      'Refreshing...',
      name: 'commonSmartRefresherHeaderRefreshingText',
      desc: '',
      args: [],
    );
  }

  /// `Refresh completed`
  String get commonSmartRefresherHeaderCompleteText {
    return Intl.message(
      'Refresh completed',
      name: 'commonSmartRefresherHeaderCompleteText',
      desc: '',
      args: [],
    );
  }

  /// `Release to refresh`
  String get commonSmartRefresherHeaderReleaseText {
    return Intl.message(
      'Release to refresh',
      name: 'commonSmartRefresherHeaderReleaseText',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get commonSmartRefresherFooterLoadingText {
    return Intl.message(
      'Loading...',
      name: 'commonSmartRefresherFooterLoadingText',
      desc: '',
      args: [],
    );
  }

  /// `Release to load more`
  String get commonSmartRefresherFooterCanLoadingText {
    return Intl.message(
      'Release to load more',
      name: 'commonSmartRefresherFooterCanLoadingText',
      desc: '',
      args: [],
    );
  }

  /// `Pull to load more`
  String get commonSmartRefresherFooterIdleText {
    return Intl.message(
      'Pull to load more',
      name: 'commonSmartRefresherFooterIdleText',
      desc: '',
      args: [],
    );
  }

  /// `Oops!`
  String get commonDialogsErrorTitle {
    return Intl.message(
      'Oops!',
      name: 'commonDialogsErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `read more`
  String get commonReadMore {
    return Intl.message(
      'read more',
      name: 'commonReadMore',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}