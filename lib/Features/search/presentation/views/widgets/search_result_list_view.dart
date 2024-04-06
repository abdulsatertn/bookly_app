import 'package:bookly_app/Features/search/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/utils/constants_classes.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(child: Text('Search for books'));
        }
        if (state is SearchSuccess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.book.length,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
                  // child: BookListViewItem(),

                  child: Text('data'),
                );
              });
        } else if (state is SearchLoading) {
          return const CustomLoadingIndecator();
        } else {
          return const CustomErrorWidget(errorMessage: 'smthg went wrong');
        }
      },
    );
  }
}
