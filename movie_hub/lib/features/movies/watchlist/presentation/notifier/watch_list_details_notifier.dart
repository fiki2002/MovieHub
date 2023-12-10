import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';

class WatchListNotifier extends ChangeNotifier {
  final WatchListDetailsUsecase _watchListDetailsUsecase;

  WatchListNotifier({required watchListDetailsUsecase})
      : _watchListDetailsUsecase = watchListDetailsUsecase;

  Future<Either<Failure, MovieDetailModel>> movieDetail(String movieId) async {
    try {
      _setWatchListState(WatchListState.isLoading);
      final response = await _watchListDetailsUsecase.call(movieId);
      return response.fold(
        (l) {
          _handleFailure(l);
          return Left(l);
        },
        (r) {
          return Right(r);
        },
      );
    } finally {
      _setWatchListState(WatchListState.isDone);
    }
  }

  WatchListState _watchListState = WatchListState.isDone;

  WatchListState get watchListState => _watchListState;

  void _setWatchListState(WatchListState state) {
    _watchListState = state;
    notifyListeners();
  }

  void _handleFailure(Failure failure) {
    _setWatchListState(WatchListState.isError);
  }
}

enum WatchListState { isLoading, isDone, isError }
