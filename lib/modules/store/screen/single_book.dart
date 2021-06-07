import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import '../../../configs/app_globals.dart';
import '../../../configs/constants.dart';
import '../../../generated/l10n.dart';
import '../../../utils/functions.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/strut_text.dart';
import '../book_model.dart';
import '../cubit/book_cubit.dart';

class SingleBook extends StatefulWidget {
  const SingleBook({Key? key}) : super(key: key);

  @override
  _SingleBookState createState() => _SingleBookState();
}

class _SingleBookState extends State<SingleBook> {
  bool loaded = false;

  void load(Book book) {
    if (!loaded) {
      globals.bookCubit!.getOneBook(book.isbn13!);
      loaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book;
    load(book);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                if (checkBookmark(book)) {
                  removeBookmark(book, context);
                  setState(() {});
                } else {
                  addToBookmarks(book, context);
                  setState(() {});
                }
              },
              icon: Icon(checkBookmark(book)
                  ? Icons.bookmark
                  : Icons.bookmark_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: BlocBuilder<BookCubit, BookState>(
        bloc: globals.bookCubit,
        builder: (context, state) {
          if (state is BookLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  state.book!.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Gap(15),
                      StrutText(state.book!.title!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .bold
                              .copyWith(fontSize: 26)),
                      const Gap(10),
                      StrutText(state.book!.authors!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .bold
                              .fs14
                              .copyWith(color: Colors.grey[500])),
                      const Gap(10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating: state.book!.rating!,
                              minRating: 1,
                              itemSize: 18,
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: print,
                            ),
                            const Gap(10),
                            Text(L10n.of(context)
                                .rateScore(state.book!.rating!)),
                          ],
                        ),
                      ),
                      const Gap(20),
                      StrutText(state.book!.desc!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey[500])),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(kWhite),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                    const Size.fromHeight(50),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.list_alt,
                                      color: kBlack,
                                    ),
                                    Text(
                                      'Preview',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .bold,
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(kWhite),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(50)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.list_alt,
                                      color: kBlack,
                                    ),
                                    Text(
                                      'Preview',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .bold,
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                      const Gap(30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(50)),
                        ),
                        child: Center(
                          child: Text(
                            L10n.of(context)
                                .buyNowButtonText(state.book!.price!),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .bold
                                .fs14
                                .white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
