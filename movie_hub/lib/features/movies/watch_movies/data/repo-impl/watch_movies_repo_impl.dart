import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class WatchMoviesRepoImpl extends WatchMoviesRepo {
  final WatchMoviesRemoteDataSource watchMovieDataSource;
  WatchMoviesRepoImpl({
    required this.watchMovieDataSource,
  });
  @override
  FutureOr<NotifierState<String>> watchMovie(String movieId) {
    return convertWithArgument(
      watchMovieDataSource.watchMovies,
      movieId,
    );
  }
}
