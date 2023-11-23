import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class DiscoverMoviesNotifier extends BaseNotifier<MoviesModel> {
  final DiscoverMoviesUsecase discoverMoviesUsecase;
  DiscoverMoviesNotifier({
    required this.discoverMoviesUsecase,
  });

  @override
  void onInit() {
    discoverMovies();
    super.onInit();
  }

  Future<void> discoverMovies() async {
    setLoading();

    state = await discoverMoviesUsecase.execute();
    notifyListeners();
  }
}
