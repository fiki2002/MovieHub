import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';

class AddToWatchListUsecase
    implements UseCaseFuture<Failure, BaseEntity, String> {
  final WatchListRepo _watchListRepo;

  AddToWatchListUsecase({
    required WatchListRepo watchListRepo,
  }) : _watchListRepo = watchListRepo;

  @override
  Future<Either<Failure, BaseEntity>> call(String movieId) async {
    return await _watchListRepo.addToWatchList(movieId);
  }
}
