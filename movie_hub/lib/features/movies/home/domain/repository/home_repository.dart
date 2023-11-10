import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

abstract class HomeRepository {
  FutureOr<NotifierState<MoviesModel>> getTrendingMovies(
    String timeWindow,
  );

  FutureOr<NotifierState<MoviesModel>> getPopularMovies();

  FutureOr<NotifierState<MoviesModel>> getTopRatedMovies();

  FutureOr<NotifierState<MoviesModel>> getUpcomingMovies();
}
