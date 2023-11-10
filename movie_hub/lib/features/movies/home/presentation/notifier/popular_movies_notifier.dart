import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class PopularMoviesNotifier extends BaseNotifier<MoviesModel> {
  final PopularMoviesUsecase popularMoviesUsecase;

  PopularMoviesNotifier({
    required this.popularMoviesUsecase,
  });

  @override
  void onInit() {
    getPopularMovies();
    super.onInit();
  }

  Future<void> getPopularMovies() async {
    setLoading();

    state = await popularMoviesUsecase.execute();
    notifyListeners();
  }
}
