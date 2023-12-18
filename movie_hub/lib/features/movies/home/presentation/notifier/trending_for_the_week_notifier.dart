import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class TrendingForTheWeekNotifier extends ChangeNotifier {
  final TrendingMoviesUseCase trendingMovieUsecase;

  TrendingForTheWeekNotifier({
    required this.trendingMovieUsecase,
  });

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];
  List<MovieResultsEntity>? get trendingForTheWeekMovies => _movies;

  Future<void> getTrendingMoviesForTheWeek({bool shouldFetch = false}) async {
    await _getTrendingMovies('week', shouldFetch: shouldFetch);
  }

  Future<void> _getTrendingMovies(
    String timeWindow, {
    bool shouldFetch = false,
  }) async {
    _setPopularMovieState(TrendingForTheWeekState.isLoading);
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }

    final trendingMoviesResponse = await trendingMovieUsecase.call(
      TrendingMoviesParams(timeWindow: timeWindow, page: _page),
    );

    trendingMoviesResponse.fold(
      (l) {
        _setPopularMovieState(TrendingForTheWeekState.isError);
      },
      (r) {
        _movies.addAll(r.results ?? []);
        _setPopularMovieState(TrendingForTheWeekState.isDone);
      },
    );
  }

  TrendingForTheWeekState _trendingForTheWeekState =
      TrendingForTheWeekState.isDone;
  TrendingForTheWeekState get trendingForTheWeekState =>
      _trendingForTheWeekState;

  void _setPopularMovieState(TrendingForTheWeekState state) {
    _trendingForTheWeekState = state;
    notifyListeners();
  }
}

enum TrendingForTheWeekState { isLoading, isError, isDone }
