import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class TopRatedMoviesNotifier extends BaseNotifier<MoviesModel> {
  final TopRatedMoviesUseCase topRatedMoviesUseCase;

  TopRatedMoviesNotifier({
    required this.topRatedMoviesUseCase,
  });

  @override
  void onInit() {
    getTopRatedMovies();
    super.onInit();
  }

  Future<void> getTopRatedMovies() async {
    setLoading();

    state = await topRatedMoviesUseCase.execute();
    notifyListeners();
  }
}
