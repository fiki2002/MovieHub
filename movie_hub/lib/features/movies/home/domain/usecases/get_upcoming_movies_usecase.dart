import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class GetUpcomingMoviesUseCase {
  final HomeRepository homeRepository;

  GetUpcomingMoviesUseCase({
    required this.homeRepository,
  });

  Future<NotifierState<MoviesModel>> execute({required int page}) async {
    return await homeRepository.getUpcomingMovies(page);
  }
}
