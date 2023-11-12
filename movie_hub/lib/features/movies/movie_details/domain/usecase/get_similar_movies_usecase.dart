import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SimilarMovieUsecase {
  final MovieDetailRepository movieDetailRepo;
  SimilarMovieUsecase({
    required this.movieDetailRepo,
  });

  Future<NotifierState<MoviesModel>> execute(String movieId) async {
    return await movieDetailRepo.getSimilarMovies(movieId);
  }
}
