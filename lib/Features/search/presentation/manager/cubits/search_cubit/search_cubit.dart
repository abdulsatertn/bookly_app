import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo, this.searchWord) : super(SearchInitial());

  final SearchRepo searchRepo;
  final String searchWord;

  Future<void> fetchSearchBooks(String searchWord) async {
    emit(SearchLoading());
    var result =
        await searchRepo.fetchSearchResultBooks(searchWord: searchWord);

    result.fold(
      (failure) => emit(SearchFailure(failure.errorMessage)),
      (books) => emit(SearchSuccess(book: books)),
    );
  }

  @override
  void onChange(Change<SearchState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }
}
