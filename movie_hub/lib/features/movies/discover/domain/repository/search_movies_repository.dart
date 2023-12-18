import 'dart:async';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

abstract class SearchMoviesRepository {
  FutureOr<Either<Failure, MoviesModel>> discoverMovies(int page);
  FutureOr<Either<Failure, MoviesModel>> searchMovies(SearchParamsModel params);
}
