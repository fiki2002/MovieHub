import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SearchMoviesUsecase
    implements UseCaseFuture<Failure, MoviesModel, SearchParamsModel> {
  final SearchMoviesRepository searchMoviesRepo;
  SearchMoviesUsecase({
    required this.searchMoviesRepo,
  });

  @override
  FutureOr<Either<Failure, MoviesModel>> call(SearchParamsModel params) async {
    return await searchMoviesRepo.searchMovies(params);
  }
}
