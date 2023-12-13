import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';

class GetWatchListMovieIdsNotifier extends BaseNotifier<List<String>> {
  final GetWatchListMovieIdsUsecase _watchListMovieIdUsecase;

  GetWatchListMovieIdsNotifier({
    required watchListMovieIdUsecase,
  }) : _watchListMovieIdUsecase = watchListMovieIdUsecase;

  Future<void> init() async {
    await getWatchListMovieId();
  }

  final List<String> _allMovieIds = [];
  List<String> get allMovieIds => _allMovieIds;

  final List<MovieDetailModel> _allWatchList = [];
  List<MovieDetailModel>? get allWatchList => _allWatchList;

  Future<void> getWatchListMovieId() async {
    setLoading();

    state = await _watchListMovieIdUsecase.execute();
    notifyListeners();

    if (state.data != null) {
      _allMovieIds.addAll(state.data!);

      for (var id in _allMovieIds) {
        _setWatchListState(GetWatchListState.loading);

        final result = await navigatorKey.currentContext!.watchListNotifier
            .movieDetail(id);
        result.fold(
          (l) {
            _setWatchListState(GetWatchListState.error);
          },
          (MovieDetailModel r) {
            _allWatchList.add(r);
            _setWatchListState(GetWatchListState.isDone);
            notifyListeners();
          },
        );
      }
    }
  }

  GetWatchListState _watchListState = GetWatchListState.isDone;

  GetWatchListState get watchListState => _watchListState;

  void _setWatchListState(GetWatchListState state) {
    _watchListState = state;
    notifyListeners();
  }
}

enum GetWatchListState { isDone, loading, error }
