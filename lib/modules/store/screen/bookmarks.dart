import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import '../../../configs/app_globals.dart';
import '../../../configs/constants.dart';
import '../../../configs/routes.dart';
import '../../../generated/l10n.dart';
import '../../../utils/functions.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/strut_text.dart';
import '../book_model.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    void gotoBook(Book book) {
      Navigator.pushNamed(context, Routes.singleBook, arguments: book);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        elevation: 0,
        centerTitle: false,
        title: StrutText('Hi, Dustin',
            style: Theme.of(context).textTheme.bodyText1!.bold.fs16),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(kPaddingM),
        child: ListView(
          children: [
            StrutText(L10n.of(context).bookmarks,
                style: Theme.of(context).textTheme.bodyText1!.bold.fs28),
            const Gap(20),
            globals.bookmarks.isEmpty
                ? const Center(
                    child: Text('You have no bookmark'),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) => InkWell(
                          onTap: () => gotoBook(globals.bookmarks[i]),
                          child: Container(
                            height: 140,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 200,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          globals.bookmarks[i].image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          StrutText(
                                            globals.bookmarks[i].title!,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .bold
                                                .fs18,
                                          ),
                                          const Gap(10),
                                          StrutText(
                                            faker.person.name(),
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    color: Colors.grey[500]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 0,
                                      minRating: 1,
                                      itemSize: 18,
                                      ignoreGestures: true,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: print,
                                    ),
                                    Container()
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (checkBookmark(globals.bookmarks[i])) {
                                        removeBookmark(
                                            globals.bookmarks[i], context);
                                        setState(() {});
                                      } else {
                                        addToBookmarks(
                                            globals.bookmarks[i], context);
                                        setState(() {});
                                      }
                                    },
                                    icon: Icon(
                                        checkBookmark(globals.bookmarks[i])
                                            ? Icons.bookmark
                                            : Icons.bookmark_outline))
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const Gap(20),
                    itemCount: globals.bookmarks.length)
          ],
        ),
      ),
    );
  }
}
