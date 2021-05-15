import 'package:flutter/material.dart';
// import 'package:salon/data/models/toolbar_option_model.dart';

// typedef ToolbarOptionModelCallback = void Function(ToolbarOptionModel sortModel);

const String kAppName = 'Boiler plate';
const String kAppVersion = '1.0.0';

/// Default theme font.
///
/// Use null for system font or font name declared in pubspec.yaml like Roboto
/// or Raleway.
const String kFontFamily = "Roboto";

// Date/time formats
const String kDateFormat = 'MMM d, y';
const String kDateTimeFormat = 'MMM d, y HH:mm';
const String kTimeFormat = 'HH:mm';

// Various Sizes
const double kBottomBarIconSize = 32.0;
const double kBoxDecorationRadius = 8.0;
const double kFormFieldsRadius = 6.0;
const double kRoundedButtonRadius = 24.0;
const double kCardRadius = 24.0;
const double kBadgeRadius = 16.0;
const double kTimelineDateSize = 88.0;

// Colors
const Color kPrimaryColor = Color(0xFF0078CE);
const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF000000);
const Color kOrange = Color(0xFFEB6200);
const Color kTransparent = Colors.transparent;

// Padding
const double kPaddingS = 10.0;
const double kPaddingM = 20.0;
const double kPaddingL = 40.0;

// Avatar sizes
const double kCircleAvatarSizeRadiusAppBar = 20.0;
const double kCircleAvatarSizeRadiusSmall = 24.0;
const double kCircleAvatarSizeRadiusLarge = 48.0;

// Animations
const Duration kRippleAnimationDuration = Duration(milliseconds: 600);
const Duration kButtonAnimationDuration = Duration(milliseconds: 200);
const Duration kPaymentCardAnimationDuration = Duration(milliseconds: 500);

/// Reservations date range in days.
const int kReservationsDateRange = 7;

/// Reservations per page.
const int kReservationsPerPage = 10;

/// Reviews per page.
const int kReviewsPerPage = 10;

/// Minimal query string length.
const int kMinimalNameQueryLength = 3;

/// Minimal password string length.
const int kMinimalPasswordLength = 8;

/// SnackBar duration in miliseconds (short).
const int kSnackBarDurationShort = 2500;

/// SnackBar duration in miliseconds (long).
const int kSnackBarDurationLong = 10000;

// Default geo position
const double kDefaultLat = 37.789682;
const double kDefaultLon = -122.3923026;

/// Default locale.
const Locale kDefaultLocale = Locale('en');

/// Review comment length limit.
const int kReviewLengthLimit = 400;

/// Terms of service URL.
const String kTermsOfServiceURL = '';

/// Privacy policy URL.
const String kPrivacyPolicyURL = '';

/// Template homepage URL.
const String kHomepageURL = '';

/// Password match regex string.
///
/// - Require that at least one digit appear anywhere in the string
/// - Require that at least one uppercase letter appear anywhere in the string
/// - The password must be at least 8 characters long
const String kPasswordRegex = r'^(?=.*[0-9])(?=.*[A-Z]).{8,}$';

/// Demo account email address.
const String kDemoEmail = 'admin@example.com';

/// Demo account password.
const String kDemoPassword = 'Password1';

/// Currency used in the application.
const String kCurrency = 'NGN';

/// Logz.io Token for remote logging.
/// Settings > General > Account Settings
const String kLogzioToken = 'flqmcXGLTlkodgJqPSpNpFCblcRQvukD';

/// Logz.io remote Url.
/// This largely depends which region you selected during registration.
const String kLogzioUrl = 'https://listener-uk.logz.io:8071/';

/// Assets images
class AssetsImages {
  static const String onboardingWelcome =
      'assets/images/onboarding/welcome.png';
}

/// Preference keys used to store/read values using [AppPreferences].
class PreferenceKey {
  static const String appVersion = 'appVersion';
  static const String isOnboarded = 'isOnboarded';
  static const String user = 'user';
  static const String language = 'language';
  static const String notification = 'notification';
  static const String darkOption = 'darkOption';
}
