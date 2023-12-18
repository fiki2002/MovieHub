import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class TrendingMoviesNotifier extends ChangeNotifier {
  final TrendingMoviesUseCase trendingMovieUsecase;

  TrendingMoviesNotifier({
    required this.trendingMovieUsecase,
  });

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];
  List<MovieResultsEntity>? get trendingMovies => _movies;

  Future<void> getTrendingMoviesForTheDay({bool shouldFetch = false}) async {
    await _getTrendingMovies('day', shouldFetch: shouldFetch);
  }

  Future<void> _getTrendingMovies(
    String timeWindow, {
    bool shouldFetch = false,
  }) async {
    _setTrendingForTheDayState(TrendingForTheDayState.isLoading);
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final trendingMoviesResponse = await trendingMovieUsecase.call(
      TrendingMoviesParams(timeWindow: timeWindow, page: _page),
    );
    trendingMoviesResponse.fold(
      (l) {
        _setTrendingForTheDayState(TrendingForTheDayState.isError);
      },
      (r) {
        _movies.addAll(r.results ?? []);
        notifyListeners();
        _setTrendingForTheDayState(TrendingForTheDayState.isDone);
      },
    );
  }

  TrendingForTheDayState _trendingForTheDayState =
      TrendingForTheDayState.isDone;
  TrendingForTheDayState get trendingMoviesForTheDay => _trendingForTheDayState;

  void _setTrendingForTheDayState(TrendingForTheDayState state) {
    _trendingForTheDayState = state;
    notifyListeners();
  }
}

enum TrendingForTheDayState { isLoading, isError, isDone }
