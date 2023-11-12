import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/data/model/movie_details_model.dart';

abstract class MovieDetailRepository {
  FutureOr<NotifierState<MovieDetailModel>> getMovieDetails(String movieId);
}
