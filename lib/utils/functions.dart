import 'package:flutter/material.dart';

import '../configs/app_globals.dart';
import '../modules/store/book_model.dart';

void addToBookmarks(Book book, BuildContext context) {
  globals.bookmarks.add(book);
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Added to bookmark'),
    duration: Duration(seconds: 1),
  ));
}

void removeBookmark(Book book, BuildContext context) {
  globals.bookmarks.removeWhere((element) => element.isbn13 == book.isbn13);
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Removed from bookmark'),
    duration: Duration(seconds: 1),
  ));
}

bool checkBookmark(Book book) {
  if (globals.bookmarks.contains(book)) {
    return true;
  } else {
    return false;
  }
}
