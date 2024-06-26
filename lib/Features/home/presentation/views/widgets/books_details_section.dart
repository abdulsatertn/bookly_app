import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/core/utils/constants_classes.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            )),
        const SizedBox(height: AppSizes.s43),
        Text(book.volumeInfo.title!,
            textAlign: TextAlign.center, style: Styles.textStyle30),
        const SizedBox(height: AppSizes.s6),
        Opacity(
          opacity: .7,
          child: Text(book.volumeInfo.authors?[0] ?? 'Unknown',
              style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(height: AppSizes.s18),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: AppSizes.s37),
        BooksAction(
          bookModel: book,
        ),
      ],
    );
  }
}
