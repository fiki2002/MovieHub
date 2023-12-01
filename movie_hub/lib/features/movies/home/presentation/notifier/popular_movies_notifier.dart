import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class PopularMoviesNotifier extends BaseNotifier<List<MovieResultsEntity>> {
  final PopularMoviesUsecase popularMoviesUsecase;

  PopularMoviesNotifier({
    required this.popularMoviesUsecase,
  });

  @override
  void onInit() {
    getPopularMovies();
    super.onInit();
  }

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];

  Future<void> getPopularMovies({bool shouldFetch = false}) async {
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final NotifierState<MoviesModel> popularMoviesResponse =
        await popularMoviesUsecase.execute(
      page: _page,
    );
    final popularMovies = popularMoviesResponse.data?.results ?? [];
    notifyListeners();

    _movies.addAll(popularMovies);
    setData(_movies);
  }
}
