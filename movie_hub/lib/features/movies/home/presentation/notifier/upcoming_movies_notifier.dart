import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class UpcomingMoviesNotifier extends ChangeNotifier {
  final GetUpcomingMoviesUseCase upcomingMoviesNotifier;

  UpcomingMoviesNotifier({
    required this.upcomingMoviesNotifier,
  });

  int _page = 1;
  final List<MovieResultsEntity> _movies = [];
  List<MovieResultsEntity>? get upcomingMovies => _movies;

  Future<void> getUpcomingMovies({bool shouldFetch = false}) async {
    _setUpcomingMoviesState(UpcomingMoviesState.isLoading);
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final res = await upcomingMoviesNotifier.call(_page);

    res.fold(
      (l) {
        _setUpcomingMoviesState(UpcomingMoviesState.isError);
      },
      (r) {
        _movies.addAll(r.results ?? []);
        notifyListeners();
        _setUpcomingMoviesState(UpcomingMoviesState.isDone);
      },
    );
  }

  UpcomingMoviesState _upcomingMoviesState = UpcomingMoviesState.isDone;
  UpcomingMoviesState get upcomingMoviesState => _upcomingMoviesState;

  void _setUpcomingMoviesState(UpcomingMoviesState state) {
    _upcomingMoviesState = state;
    notifyListeners();
  }
}

enum UpcomingMoviesState { isLoading, isError, isDone }
