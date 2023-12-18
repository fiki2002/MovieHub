import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MovieDetailUsecase
    implements UseCaseFuture<Failure, MovieDetailModel, String> {
  final MovieDetailRepository movieDetailRepo;
  MovieDetailUsecase({
    required this.movieDetailRepo,
  });

  @override
  FutureOr<Either<Failure, MovieDetailModel>> call(String params) async {
    return await movieDetailRepo.getMovieDetails(params);
  }
}
