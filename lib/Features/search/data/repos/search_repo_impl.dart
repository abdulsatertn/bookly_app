import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  // final String searchWord;

  // SearchRepoImpl(this.apiService, this.searchWord);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResultBooks(
      {required String searchWord}) async {
    try {
      var data = await apiService.get(
          endPoints:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=$searchWord');
      List<BookModel> book = [];
      for (var item in data['items']) {
        try {
          book.add(BookModel.fromJson(item));
        } catch (e) {
          book.add(BookModel.fromJson(item));
        }
      }
      return Right(book);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
