import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class CheckMovieWatchListStatusNotifier extends ChangeNotifier {
  final CheckIfMovieIsAUsecase _checkWatchListStatus;

  CheckMovieWatchListStatusNotifier({
    required CheckIfMovieIsAUsecase checkWatchListStatus,
  }) : _checkWatchListStatus = checkWatchListStatus;

  bool? isWatchListStatus;
  Future<Either<Failure, bool>> isMovieAWatchList(String movieId) async {
    try {
      _setWatchListState(WatchListState.isLoading);
      final response = await _checkWatchListStatus.call(movieId);
      return response.fold(
        (l) {
          _handleFailure(l);
          return Left(l);
        },
        (r) {
          isWatchListStatus = r;
          return Right(r);
        },
      );
    } finally {
      _setWatchListState(WatchListState.isDone);
    }
  }

  void watchListAction(String movieId) async {
    switch (isWatchListStatus) {
      case true:
        isWatchListStatus = false;
        notifyListeners();
        _remove(movieId, isWatchListStatus);
        break;
      case false:
        isWatchListStatus = true;
        notifyListeners();
        _add(movieId, isWatchListStatus);
        break;
      default:
    }
  }

  void _remove(String movieId, bool? isWatchListStatus) async {
    final result = await navigatorKey.currentContext!.removeFromWatchList
        .removeFromWatchList(movieId);
    result.fold(
      (l) {
        isWatchListStatus = true;
        notifyListeners();
      },
      (r) {
        isWatchListStatus = false;
        notifyListeners();
      },
    );
  }

  void _add(String movieId, bool? isWatchListStatus) async {
    final result = await navigatorKey.currentContext!.addToWatchList
        .addToWatchList(movieId);
    result.fold((l) {
      isWatchListStatus = false;
      notifyListeners();
    }, (r) {
      isWatchListStatus = true;
      notifyListeners();
    });
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
