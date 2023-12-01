import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class TrendingForTheWeekNotifier
    extends BaseNotifier<List<MovieResultsEntity>> {
  final TrendingMoviesUseCase trendingMovieUsecase;

  TrendingForTheWeekNotifier({
    required this.trendingMovieUsecase,
  });

  @override
  void onInit() {
    getTrendingMoviesForTheWeek();
    super.onInit();
  }

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];
  Future<void> getTrendingMoviesForTheWeek({bool shouldFetch = false}) async {
    await _getTrendingMovies('week', shouldFetch: shouldFetch);
  }

  Future<void> _getTrendingMovies(
    String timeWindow, {
    bool shouldFetch = false,
  }) async {
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }

    final NotifierState<MoviesModel> trendingMoviesResponse =
        await trendingMovieUsecase.execute(
      timeWindow,
      page: _page,
    );

    final trendingMovies = trendingMoviesResponse.data?.results ?? [];
    notifyListeners();

    _movies.addAll(trendingMovies);
    setData(_movies);
  }
}
