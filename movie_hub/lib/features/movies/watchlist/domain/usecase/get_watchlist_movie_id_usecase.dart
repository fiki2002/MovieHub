import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';

class GetWatchListMovieIdsUsecase
    implements UseCaseFuture<Failure, List<String>, NoParams> {
  final WatchListRepo watchListRepo;
  GetWatchListMovieIdsUsecase({
    required this.watchListRepo,
  });

  @override
  FutureOr<Either<Failure, List<String>>> call(NoParams params) async {
    return await watchListRepo.watchListMovieIds();
  }
}
