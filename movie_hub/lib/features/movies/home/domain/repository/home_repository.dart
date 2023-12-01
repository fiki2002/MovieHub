import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

abstract class HomeRepository {
  FutureOr<NotifierState<MoviesModel>> getTrendingMovies(
    String timeWindow,
    int page,
  );

  FutureOr<NotifierState<MoviesModel>> getPopularMovies(int page);

  FutureOr<NotifierState<MoviesModel>> getTopRatedMovies(int page);

  FutureOr<NotifierState<MoviesModel>> getUpcomingMovies(int page);
}
