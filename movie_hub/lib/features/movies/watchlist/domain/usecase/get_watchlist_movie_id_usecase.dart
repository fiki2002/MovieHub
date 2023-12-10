import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';

class GetWatchListMovieIdsUsecase {
  final WatchListRepo watchListRepo;
  GetWatchListMovieIdsUsecase({
    required this.watchListRepo,
  });

  Future<NotifierState<List<String>>> execute() async {
    return await watchListRepo.watchListMovieIds();
  }
}
