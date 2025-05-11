import 'package:bookly/Features/Home/data/model/bookModel.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

import 'BookAction.dart';
import 'BookRating.dart';
import 'CustomAppBarBookDeatils.dart';
import 'CustomBookImage.dart';
import 'SimilarBooksListView.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: CustomBookImage(
              imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? "",
            ),
          ),
          const SizedBox(height: 40),
          Text(
            textAlign: TextAlign.center,
            bookModel.volumeInfo!.title!,
            style: Styles.TimesNewRoman.copyWith(fontSize: 32),
          ),
          const SizedBox(height: 6),
          Text(
            bookModel.volumeInfo!.authors![0],
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 18,
          ),
          BookRating(
            rating: bookModel.volumeInfo?.pageCount ?? 0,
            count: bookModel.volumeInfo?.pageCount ?? 0,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 37,
          ),
            BooksAction(bookModel: bookModel,),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also Like",
              style: Styles.textStyle14
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(child: SimilarBooksListView()),
        ],
      ),
    );
  }
}
