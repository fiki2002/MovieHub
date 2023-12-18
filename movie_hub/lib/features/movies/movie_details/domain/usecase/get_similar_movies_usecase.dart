import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SimilarMovieUsecase     implements UseCaseFuture<Failure, MoviesModel, String> {
  final MovieDetailRepository movieDetailRepo;
  SimilarMovieUsecase({
    required this.movieDetailRepo,
  });

  @override
  FutureOr<Either<Failure, MoviesModel>> call(String params) async {
    return await movieDetailRepo.getSimilarMovies(params);

  }
}
