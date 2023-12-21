import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class WatchListDetailsNotifier extends ChangeNotifier {
  final MovieDetailUsecase _movieDetailUsecase;

  WatchListDetailsNotifier({
    required MovieDetailUsecase movieDetailUsecase,
  }) : _movieDetailUsecase = movieDetailUsecase;

  final List<MovieDetailModel> _allWatchList = [];
  List<MovieDetailModel>? get allWatchList => _allWatchList;

  Future<void> getWatchListMovieDetail() async {
    /// Get all watchlist movie Ids
    ///
    final List<String> watchlistId =
        navigatorKey.currentContext!.getWatchListId.allMovieIds;

    for (var id in watchlistId) {
      _setWatchListState(WatchListState.loading);

      final res = await _movieDetailUsecase.call(id);

      res.fold(
        (l) {
          _setWatchListState(WatchListState.error);
        },
        (MovieDetailModel r) {
          _allWatchList.add(r);
          _setWatchListState(WatchListState.isDone);
        },
      );
    }
    notifyListeners();
  }

  WatchListState _watchListState = WatchListState.isDone;

  WatchListState get watchListState => _watchListState;

  void _setWatchListState(WatchListState state) {
    _watchListState = state;
    notifyListeners();
  }
}

enum WatchListState { isDone, loading, error }
