import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../../cores/errors/failures.dart';
import '../entities/trending_movies_entity.dart';

abstract class TrendingMoviesRepository {
  FutureOr<Either<Failure, List<TrendingMovieEntity>>> getTrendingMovies();
}
