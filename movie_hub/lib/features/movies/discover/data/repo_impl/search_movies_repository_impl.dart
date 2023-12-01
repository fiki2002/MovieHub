import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SearchMovieImpl extends SearchMoviesRepository {
  final SearchMovieDataSource searchMovieDataSource;

  SearchMovieImpl({
    required this.searchMovieDataSource,
  });

  @override
  FutureOr<NotifierState<MoviesModel>> discoverMovies(int page) {
    return convert(
      () => searchMovieDataSource.discoverMovies(page),
    );
  }

  @override
  FutureOr<NotifierState<MoviesModel>> searchMovies(SearchParamsModel params) {
    return convertWithArgument(
      searchMovieDataSource.searchMovies,
      params,
    );
  }
}
