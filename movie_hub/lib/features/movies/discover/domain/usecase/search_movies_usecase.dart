import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SearchMoviesUsecase{
  final SearchMoviesRepository searchMoviesRepo;
  SearchMoviesUsecase({
    required this.searchMoviesRepo,
  });

  Future<NotifierState<MoviesModel>> execute(SearchParamsModel params) async {
    return await searchMoviesRepo.searchMovies(params);
  }
}