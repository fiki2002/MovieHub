import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';

class AddToWatchListNotifier extends ChangeNotifier {
  final AddToWatchListUsecase _addToWatchListUsecase;

  AddToWatchListNotifier({required addToWatchListNotifier})
      : _addToWatchListUsecase = addToWatchListNotifier;

  Future<Either<Failure, BaseEntity>> addToWatchList(String movieId) async {
    try {
      _setUpAddToWatchListState(AddToWatchListState.isLoading);
      final response = await _addToWatchListUsecase.call(movieId);
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
      _setUpAddToWatchListState(AddToWatchListState.isDone);
    }
  }

  AddToWatchListState _authState = AddToWatchListState.isDone;

  AddToWatchListState get authState => _authState;

  void _setUpAddToWatchListState(AddToWatchListState state) {
    _authState = state;
    notifyListeners();
  }

  void _handleFailure(Failure failure) {
    _setUpAddToWatchListState(AddToWatchListState.isError);

    SnackBarService.showErrorSnackBar(
      context: navigatorKey.currentContext!,
      message: failure.message,
    );
  }

  void _handleSuccess(BaseEntity res) {
    _setUpAddToWatchListState(AddToWatchListState.isDone);

    SnackBarService.showSuccessSnackBar(
      context: navigatorKey.currentContext!,
      message: res.message,
    );
  }

}
enum AddToWatchListState { isLoading, isDone, isError }
