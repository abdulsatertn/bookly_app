import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),

      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          String searchWord = ''; // Get user input dynamically
          return BlocProvider(
            create: (context) => SearchCubit(
              getIt.get<SearchRepoImpl>(),
              searchWord,
            ),
            child: const SearchView(),
          );
        },
      ),

      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) =>
      //         SearchCubit(getIt.get<SearchRepoImpl>(), 'searchKeyword'),
      //     child: const SearchView(),
      //   )
      // ),
    ],
  );
}
