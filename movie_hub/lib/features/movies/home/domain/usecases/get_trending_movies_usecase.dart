import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class TrendingMoviesUseCase
    implements UseCaseFuture<Failure, MoviesModel, TrendingMoviesParams> {
  final HomeRepository homeRepository;

  TrendingMoviesUseCase({
    required this.homeRepository,
  });

  @override
  FutureOr<Either<Failure, MoviesModel>> call(
    TrendingMoviesParams params,
  ) async {
    return await homeRepository.getTrendingMovies(
      params.timeWindow,
      params.page,
    );
  }
}

class TrendingMoviesParams {
  final String timeWindow;
  final int page;
  TrendingMoviesParams({
    required this.timeWindow,
    required this.page,
  });
}
