import 'dart:async';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
export 'package:fpdart/fpdart.dart';

class DiscoverMoviesUsecase implements UseCaseFuture<Failure,MoviesModel, int> {
  final SearchMoviesRepository searchMoviesRepo;
  DiscoverMoviesUsecase({
    required this.searchMoviesRepo,
  });

  @override
  FutureOr<Either<Failure,MoviesModel>> call(int params) async{
  return await searchMoviesRepo.discoverMovies(params);
  }
}
