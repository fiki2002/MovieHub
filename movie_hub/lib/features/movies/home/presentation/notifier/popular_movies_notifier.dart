import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class PopularMoviesNotifier extends ChangeNotifier {
  final PopularMoviesUsecase popularMoviesUsecase;

  PopularMoviesNotifier({
    required this.popularMoviesUsecase,
  });

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];
  List<MovieResultsEntity>? get popularMovies => _movies;

  Future<void> getPopularMovies({bool shouldFetch = false}) async {
    _setPopularMovieState(PopularMovieState.isLoading);

    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final popularMoviesResponse = await popularMoviesUsecase.call(_page);

    popularMoviesResponse.fold(
      (l) {
        _setPopularMovieState(PopularMovieState.isError);
      },
      (r) {
        _movies.addAll(r.results ?? []);
        notifyListeners();
        _setPopularMovieState(PopularMovieState.isDone);
      },
    );
  }

  PopularMovieState _popularMovieState = PopularMovieState.isDone;
  PopularMovieState get popularMovieState => _popularMovieState;

  void _setPopularMovieState(PopularMovieState state) {
    _popularMovieState = state;
    notifyListeners();
  }
}

enum PopularMovieState { isLoading, isError, isDone }
