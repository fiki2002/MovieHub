import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

abstract class SearchMoviesRepository {
  FutureOr<NotifierState<MoviesModel>> discoverMovies();
  FutureOr<NotifierState<MoviesModel>> searchMovies(SearchParamsModel params);
}
