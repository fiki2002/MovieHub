import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class TopRatedMoviesNotifier extends ChangeNotifier {
  final TopRatedMoviesUseCase topRatedMoviesUseCase;

  TopRatedMoviesNotifier({
    required this.topRatedMoviesUseCase,
  });

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];
  List<MovieResultsEntity>? get topRatedMovies => _movies;

  Future<void> getTopRatedMovies({bool shouldFetch = false}) async {
    _setTopRatedMoviesState(TopRatedMoviesState.isLoading);
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final topRatedMoviesResponse = await topRatedMoviesUseCase.call(_page);
    topRatedMoviesResponse.fold(
      (l) {
        _setTopRatedMoviesState(TopRatedMoviesState.isError);
      },
      (r) {
        _movies.addAll(r.results ?? []);
        notifyListeners();
        _setTopRatedMoviesState(TopRatedMoviesState.isDone);
      },
    );
  }

  TopRatedMoviesState _topRatedMoviesState = TopRatedMoviesState.isDone;
  TopRatedMoviesState get topRatedMoviesState => _topRatedMoviesState;

  void _setTopRatedMoviesState(TopRatedMoviesState state) {
    _topRatedMoviesState = state;
    notifyListeners();
  }
}

enum TopRatedMoviesState { isLoading, isError, isDone }
