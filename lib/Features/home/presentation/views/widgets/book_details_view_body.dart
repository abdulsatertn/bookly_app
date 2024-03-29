import 'package:bookly_app/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:bookly_app/core/utils/constants_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      // so i can scroll with using expanded sized box
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                SizedBox(height: AppSizes.s24),
                BookDetailsSection(),

                Expanded(
                    child: SizedBox(
                        height:
                            40)), // so the list will be always in the bottom of the screen

                SimilarBooksSection(),
                SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
