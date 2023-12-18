import 'dart:async';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

abstract class HomeRepository {
  FutureOr<Either<Failure, MoviesModel>> getTrendingMovies(
    String timeWindow,
    int page,
  );

  FutureOr<Either<Failure, MoviesModel>> getPopularMovies(int page);

  FutureOr<Either<Failure, MoviesModel>> getTopRatedMovies(int page);

  FutureOr<Either<Failure, MoviesModel>> getUpcomingMovies(int page);
}
