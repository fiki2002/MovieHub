import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/profile/profile.dart';

abstract class WatchListRepo {
  Future<Either<Failure, BaseEntity>> addToWatchList(String movieId);
  Future<Either<Failure, BaseEntity>> removeFromWatchList(String movieId);
  FutureOr<NotifierState<List<String>>> watchListMovieIds();
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(String movieId);
}
