import 'package:bookly_app/core/utils/constants_classes.dart';
import 'package:flutter/material.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
            // child: BookListViewItem(),

            child: Text('data'),
          );
        });
  }
}
