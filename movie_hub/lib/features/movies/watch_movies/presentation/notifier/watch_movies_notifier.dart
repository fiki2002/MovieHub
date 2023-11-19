import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class WatchMovieNotifier extends BaseNotifier<String> {
  final WatchMoviesUsecase watchMoviesUsecase;
  final String movieId;

  WatchMovieNotifier({
    required this.watchMoviesUsecase,
    required this.movieId,
  });

  @override
  void onInit() {
    watchMovies(movieId);
    super.onInit();
  }

  Future<void> watchMovies(String movieId) async {
    setLoading();
    state = await watchMoviesUsecase.execute(movieId);
    notifyListeners();
  }
}
