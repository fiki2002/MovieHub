import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class WatchMoviesUsecase {
  final WatchMoviesRepo watchMoviesRepo;
  WatchMoviesUsecase({
    required this.watchMoviesRepo,
  });

  Future<NotifierState<String>> execute(String movieId) async {
    return await watchMoviesRepo.watchMovie(movieId);
  }
}
