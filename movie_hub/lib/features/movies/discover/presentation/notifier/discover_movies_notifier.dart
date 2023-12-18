import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class DiscoverMoviesNotifier extends ChangeNotifier {
  final DiscoverMoviesUsecase discoverMoviesUsecase;
  DiscoverMoviesNotifier({
    required this.discoverMoviesUsecase,
  });

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];
  List<MovieResultsEntity> get discoveredMovies => _movies;

  Future<void> discoverMovies({bool shouldFetch = false}) async {
    if (!shouldFetch) {
      _setDiscoverMovieState(DiscoverMovieState.loading);
    }
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }

    final discoveredMoviesResponse = await discoverMoviesUsecase.call(_page);

    discoveredMoviesResponse.fold(
      (l) {
        _setDiscoverMovieState(DiscoverMovieState.error);
      },
      (moviesModel) {
        final discoveredMovies = moviesModel.results ?? [];
        _movies.addAll(discoveredMovies);
        notifyListeners();
        _setDiscoverMovieState(DiscoverMovieState.idle);
      },
    );
  }

  DiscoverMovieState _discoverMovieState = DiscoverMovieState.idle;

  DiscoverMovieState get discoverMovieState => _discoverMovieState;

  void _setDiscoverMovieState(DiscoverMovieState state) {
    _discoverMovieState = state;
    notifyListeners();
  }
}

enum DiscoverMovieState { idle, error, loading }
