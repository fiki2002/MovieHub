import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class UpcomingMoviesNotifier extends BaseNotifier<MoviesModel> {
  final GetUpcomingMoviesUseCase upcomingMoviesNotifier;

  UpcomingMoviesNotifier({
    required this.upcomingMoviesNotifier,
  });

  @override
  void onInit() {
    getPopularMovies();
    super.onInit();
  }

  Future<void> getPopularMovies() async {
    setLoading();

    state = await upcomingMoviesNotifier.execute();
    notifyListeners();
  }
}
