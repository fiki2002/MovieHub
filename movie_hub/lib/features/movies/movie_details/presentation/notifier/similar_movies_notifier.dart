import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class SimilarMoviesNotifier extends ChangeNotifier {
  final SimilarMovieUsecase similarMovieUsecase;

  SimilarMoviesNotifier({
    required this.similarMovieUsecase,
  });

  MoviesModel? _similarMovies;
  MoviesModel? get similarMovies => _similarMovies;

  Future<void> getSimilarMovies(String movieId) async {
    _setSimilarState(SimilarMoviesState.isLoading);
    final res = await similarMovieUsecase.call(movieId);
    res.fold(
      (l) {
        _setSimilarState(SimilarMoviesState.isError);
      },
      (r) {
        _similarMovies = r;
        notifyListeners();
        _setSimilarState(SimilarMoviesState.isDone);
      },
    );
  }

  SimilarMoviesState _similarMoviesState = SimilarMoviesState.isDone;
  SimilarMoviesState get similarMoviesState => _similarMoviesState;

  void _setSimilarState(SimilarMoviesState state) {
    _similarMoviesState = state;
    notifyListeners();
  }
}

enum SimilarMoviesState { isLoading, isError, isDone }
