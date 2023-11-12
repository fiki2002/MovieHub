import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class MovieDetailsNotifier extends BaseNotifier<MovieDetailModel> {
  final MovieDetailUsecase movieDetailsUsecase;
  final String movieId;

  MovieDetailsNotifier({
    required this.movieDetailsUsecase,
    required this.movieId,
  });
  @override
  void onInit() {
    getMovieDetails(movieId);
  }

  Future<void> getMovieDetails(String movieId) async {
    setLoading();
    state = await movieDetailsUsecase.execute(movieId);
    notifyListeners();
  }
}
