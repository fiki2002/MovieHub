import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class SimilarMoviesNotifier extends BaseNotifier<MoviesModel> {
  final SimilarMovieUsecase similarMovieUsecase;

  SimilarMoviesNotifier({
    required this.similarMovieUsecase,
  });
  void init(String movieId) {
    getMovieDetails(movieId);
  }

  Future<void> getMovieDetails(String movieId) async {
    setLoading();
    state = await similarMovieUsecase.execute(movieId);
    notifyListeners();
  }
}
