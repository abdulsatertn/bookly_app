import 'package:bookly_app/Features/search/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(onSubmitted: (data) {
            searchCubit.fetchSearchBooks(data);
          }),
          const SizedBox(height: 16),
          // const Padding(
          //     padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
          //     child: Text('Search For Books')),
          const Expanded(child: SearchResultsListView()),
        ],
      ),
    );
  }
}
