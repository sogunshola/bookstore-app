import 'package:bookstore/modules/store/screen/bookmarks.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';

import '../configs/app_globals.dart';
import '../configs/constants.dart';
import '../modules/store/screen/home.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  void initState() {
    // globals.bookCubit!.getNewBooks();
    globals.bookCubit!.getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      color: Theme.of(context).cardColor,
      selectedIconColor: Theme.of(context).textTheme.bodyText1!.color!,
      unselectedIconColor: kGrey,
      borderRadius: kCardRadius,
      items: [
        FloatingNavBarItem(
            iconData: Icons.home_outlined,
            page: const HomeScreen(),
            title: 'Home'),
        FloatingNavBarItem(
            iconData: Icons.bookmark_outline,
            page: const BookmarksScreen(),
            title: 'Doctors'),
        FloatingNavBarItem(
            iconData: Icons.shopping_cart_outlined,
            page: Container(),
            title: 'Reminders'),
        FloatingNavBarItem(
            iconData: Icons.settings_outlined,
            page: Container(),
            title: 'Records'),
      ],
      horizontalPadding: 20.0,
      hapticFeedback: false,
      showTitle: false,
    );
  }
}
