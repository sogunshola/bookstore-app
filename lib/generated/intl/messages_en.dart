// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(price) => "Buy Now for ${price}";

  static String m1(mins) => "in 1 hour, ${mins} mins";

  static String m2(hours) => "in 1 day, ${hours} hours";

  static String m3(days) => "in ${days} days";

  static String m4(hours) => "in ${hours} hours";

  static String m5(mins) => "in ${mins} mins";

  static String m6(rate) => "${rate}/5.0";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bookmarks": MessageLookupByLibrary.simpleMessage("Bookmarks"),
        "buyNowButtonText": m0,
        "commonBtnApply": MessageLookupByLibrary.simpleMessage("Apply"),
        "commonBtnCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "commonBtnClose": MessageLookupByLibrary.simpleMessage("Close"),
        "commonBtnOk": MessageLookupByLibrary.simpleMessage("Ok"),
        "commonDialogsErrorTitle":
            MessageLookupByLibrary.simpleMessage("Oops!"),
        "commonElapseHhourMins": m1,
        "commonElapsedDayHours": m2,
        "commonElapsedDays": m3,
        "commonElapsedHours": m4,
        "commonElapsedMins": m5,
        "commonElapsedNow": MessageLookupByLibrary.simpleMessage("in process"),
        "commonReadMore": MessageLookupByLibrary.simpleMessage("read more"),
        "commonSmartRefresherFooterCanLoadingText":
            MessageLookupByLibrary.simpleMessage("Release to load more"),
        "commonSmartRefresherFooterIdleText":
            MessageLookupByLibrary.simpleMessage("Pull to load more"),
        "commonSmartRefresherFooterLoadingText":
            MessageLookupByLibrary.simpleMessage("Loading..."),
        "commonSmartRefresherHeaderCompleteText":
            MessageLookupByLibrary.simpleMessage("Refresh completed"),
        "commonSmartRefresherHeaderIdleText":
            MessageLookupByLibrary.simpleMessage("Pull down to refresh"),
        "commonSmartRefresherHeaderRefreshingText":
            MessageLookupByLibrary.simpleMessage("Refreshing..."),
        "commonSmartRefresherHeaderReleaseText":
            MessageLookupByLibrary.simpleMessage("Release to refresh"),
        "loginButtonText": MessageLookupByLibrary.simpleMessage("Sign In"),
        "loginScreenTitle":
            MessageLookupByLibrary.simpleMessage("Let\'s sign you in"),
        "newestBooks": MessageLookupByLibrary.simpleMessage("Newest"),
        "passwordHintText": MessageLookupByLibrary.simpleMessage("Password"),
        "popularBooks": MessageLookupByLibrary.simpleMessage("Popular Books"),
        "rateScore": m6,
        "usernameHintText": MessageLookupByLibrary.simpleMessage("Username")
      };
}
