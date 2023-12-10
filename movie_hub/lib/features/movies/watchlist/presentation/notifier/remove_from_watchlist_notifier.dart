import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';

class RemoveFromWatchListNotifier extends ChangeNotifier {
  final RemoveFromWatchListUsecase _removeWatchListUsecase;

  RemoveFromWatchListNotifier({
    required removeFromWatchListNotifier,
  }) : _removeWatchListUsecase = removeFromWatchListNotifier;

  Future<Either<Failure, BaseEntity>> removeFromWatchList(
    String movieId,
  ) async {
    try {
      _setUpAddToWatchListState(RemoveFromWatchListState.isLoading);
      final response = await _removeWatchListUsecase.call(movieId);
      return response.fold(
        (l) {
          _handleFailure(l);
          return Left(l);
        },
        (r) {
          _handleSuccess(r);
          return Right(r);
        },
      );
    } finally {
      _setUpAddToWatchListState(RemoveFromWatchListState.isDone);
    }
  }

  RemoveFromWatchListState _addToWatchListState =
      RemoveFromWatchListState.isDone;

  RemoveFromWatchListState get addToWatchListState => _addToWatchListState;

  void _setUpAddToWatchListState(RemoveFromWatchListState state) {
    _addToWatchListState = state;
    notifyListeners();
  }

  void _handleFailure(Failure failure) {
    _setUpAddToWatchListState(RemoveFromWatchListState.isError);

    SnackBarService.showErrorSnackBar(
      context: navigatorKey.currentContext!,
      message: failure.message,
    );
  }

  void _handleSuccess(BaseEntity res) {
    _setUpAddToWatchListState(RemoveFromWatchListState.isDone);

    SnackBarService.showSuccessSnackBar(
      context: navigatorKey.currentContext!,
      message: res.message,
    );
  }
}

enum RemoveFromWatchListState { isLoading, isDone, isError }
