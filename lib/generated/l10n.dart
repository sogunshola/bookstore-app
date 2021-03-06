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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
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

  /// `Let's sign you in`
  String get loginScreenTitle {
    return Intl.message(
      'Let\'s sign you in',
      name: 'loginScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get loginButtonText {
    return Intl.message(
      'Sign In',
      name: 'loginButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get usernameHintText {
    return Intl.message(
      'Username',
      name: 'usernameHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHintText {
    return Intl.message(
      'Password',
      name: 'passwordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Popular Books`
  String get popularBooks {
    return Intl.message(
      'Popular Books',
      name: 'popularBooks',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get newestBooks {
    return Intl.message(
      'Newest',
      name: 'newestBooks',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now for {price}`
  String buyNowButtonText(Object price) {
    return Intl.message(
      'Buy Now for $price',
      name: 'buyNowButtonText',
      desc: '',
      args: [price],
    );
  }

  /// `{rate}/5.0`
  String rateScore(Object rate) {
    return Intl.message(
      '$rate/5.0',
      name: 'rateScore',
      desc: '',
      args: [rate],
    );
  }

  /// `Bookmarks`
  String get bookmarks {
    return Intl.message(
      'Bookmarks',
      name: 'bookmarks',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
