import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class PopularMoviesUsecase {
  final HomeRepository homeRepository;
  PopularMoviesUsecase({
    required this.homeRepository,
  });

  Future<NotifierState<MoviesModel>> execute({required int page}) async {
    return await homeRepository.getPopularMovies(page);
  }
}
