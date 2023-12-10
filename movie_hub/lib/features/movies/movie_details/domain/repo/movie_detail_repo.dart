import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

abstract class MovieDetailRepository {
  FutureOr<NotifierState<MovieDetailModel>> getMovieDetails(String movieId);
  FutureOr<NotifierState<ImageModel>> getImages(String movieId);
  FutureOr<NotifierState<MoviesModel>> getSimilarMovies(String movieId);
  Future<Either<Failure, bool>> isMovieAWatchList(String movieId);
}
