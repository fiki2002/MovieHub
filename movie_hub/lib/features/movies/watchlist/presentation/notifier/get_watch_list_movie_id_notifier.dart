import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';

class GetWatchListMovieIdsNotifier extends ChangeNotifier {
  final GetWatchListMovieIdsUsecase _watchListMovieIdUsecase;

  GetWatchListMovieIdsNotifier({
    required watchListMovieIdUsecase,
  }) : _watchListMovieIdUsecase = watchListMovieIdUsecase;

  Future<void> init() async {
    await getWatchListMovieId();
  }

  final List<String> _allMovieIds = [];
  List<String> get allMovieIds => _allMovieIds;

  Future<void> getWatchListMovieId() async {
    final res = await _watchListMovieIdUsecase.call(const NoParams());
    return res.fold(
      (l) {},
      (r) async {
        _allMovieIds.addAll(r);
      },
    );
  }

}

enum GetWatchListState { isDone, loading, error }
