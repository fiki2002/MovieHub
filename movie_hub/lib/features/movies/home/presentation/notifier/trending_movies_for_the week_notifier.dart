import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class TrendingForTheWeekNotifier extends BaseNotifier<MoviesModel> {
  final TrendingMoviesUseCase trendingMovieUsecase;

  TrendingForTheWeekNotifier({
    required this.trendingMovieUsecase,
  });

  @override
  void onInit() {
    getTrendingMoviesForTheWeek();
    super.onInit();
  }

  Future<void> getTrendingMoviesForTheWeek() async {
    await _getTrendingMovies('week');
  }

  Future<void> _getTrendingMovies(String timeWindow) async {
    setLoading();

    state = await trendingMovieUsecase.execute(timeWindow);
    notifyListeners();
  }
}
