import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/models/book_model/book_model.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilardBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errorMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }

  @override
  void onChange(Change<SimilarBooksState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }
}
