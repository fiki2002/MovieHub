import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class TopRatedMoviesNotifier extends BaseNotifier<List<MovieResultsEntity>> {
  final TopRatedMoviesUseCase topRatedMoviesUseCase;

  TopRatedMoviesNotifier({
    required this.topRatedMoviesUseCase,
  });

  @override
  void onInit() {
    getTopRatedMovies();
    super.onInit();
  }

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];

  Future<void> getTopRatedMovies({bool shouldFetch = false}) async {
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final NotifierState<MoviesModel> topRatedMoviesResponse =
        await topRatedMoviesUseCase.execute(page: _page);

    final topRatedMovies = topRatedMoviesResponse.data?.results ?? [];
    notifyListeners();

    _movies.addAll(topRatedMovies);
    setData(_movies);
  }
}
