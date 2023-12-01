import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class TopRatedMoviesUseCase {
  final HomeRepository homeRepository;

  TopRatedMoviesUseCase({
    required this.homeRepository,
  });

  Future<NotifierState<MoviesModel>> execute({required int page} ) async {
    return await homeRepository.getTopRatedMovies(page);
  }
}
