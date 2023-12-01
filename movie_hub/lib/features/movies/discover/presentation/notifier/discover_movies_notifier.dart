import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class DiscoverMoviesNotifier extends BaseNotifier<List<MovieResultsEntity>> {
  final DiscoverMoviesUsecase discoverMoviesUsecase;
  DiscoverMoviesNotifier({
    required this.discoverMoviesUsecase,
  });

  @override
  void onInit() {
    discoverMovies();
    super.onInit();
  }

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];

  Future<void> discoverMovies({bool shouldFetch = false}) async {
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final NotifierState<MoviesModel> discoveredMoviesResponse =
        await discoverMoviesUsecase.execute(page: _page);
    final discoveredMovies = discoveredMoviesResponse.data?.results ?? [];
    notifyListeners();

    _movies.addAll(discoveredMovies);
    setData(_movies);
  }
}
