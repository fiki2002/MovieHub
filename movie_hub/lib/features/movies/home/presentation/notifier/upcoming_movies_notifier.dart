import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class UpcomingMoviesNotifier extends BaseNotifier<List<MovieResultsEntity>> {
  final GetUpcomingMoviesUseCase upcomingMoviesNotifier;

  UpcomingMoviesNotifier({
    required this.upcomingMoviesNotifier,
  });

  @override
  void onInit() {
    getUpcomingMovies();
    super.onInit();
  }

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];

  Future<void> getUpcomingMovies({bool shouldFetch = false}) async {
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final NotifierState<MoviesModel> upcomingMoviesResponse =
        await upcomingMoviesNotifier.execute(page: _page);
    final upcomingMovies = upcomingMoviesResponse.data?.results ?? [];

    notifyListeners();

    _movies.addAll(upcomingMovies);
    setData(_movies);
  }
}
