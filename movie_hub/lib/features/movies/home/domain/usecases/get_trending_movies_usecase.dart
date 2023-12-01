import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class TrendingMoviesUseCase {
  final HomeRepository homeRepository;

  TrendingMoviesUseCase({
    required this.homeRepository,
  });

  Future<NotifierState<MoviesModel>> execute(
    String timeWindow, {
    required int page ,
  }) async {
    return await homeRepository.getTrendingMovies(timeWindow, page);
  }
}


// RemoteDS *-> Repo *-> Use