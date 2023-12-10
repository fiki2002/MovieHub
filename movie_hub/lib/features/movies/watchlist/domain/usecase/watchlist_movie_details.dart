import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/data/model/movie_details_model.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';

class WatchListDetailsUsecase
    extends UseCaseFuture<Failure, MovieDetailModel, String> {
  final WatchListRepo _watchListRepo;

  WatchListDetailsUsecase({
    required WatchListRepo watchListRepo,
  }) : _watchListRepo = watchListRepo;

  @override
  FutureOr<Either<Failure, MovieDetailModel>> call(String params) async {
    return await _watchListRepo.getMovieDetail(params);
  }
}
