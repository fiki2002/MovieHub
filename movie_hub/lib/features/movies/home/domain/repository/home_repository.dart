import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';


abstract class HomeRepository {
  FutureOr<NotifierState<TrendingMoviesModel>> getTrendingMovies(String timeWindow);
}
