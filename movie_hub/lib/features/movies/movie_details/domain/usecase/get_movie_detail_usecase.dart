import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MovieDetailUsecase {
  final MovieDetailRepository movieDetailRepo;
  MovieDetailUsecase({
    required this.movieDetailRepo,
  });

  Future<NotifierState<MovieDetailModel>> execute(String movieId) async {
    return await movieDetailRepo.getMovieDetails(movieId);
  }
}
