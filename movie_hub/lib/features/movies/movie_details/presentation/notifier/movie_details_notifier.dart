import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class MovieDetailsNotifier extends ChangeNotifier {
  final MovieDetailUsecase movieDetailsUsecase;

  MovieDetailsNotifier({
    required this.movieDetailsUsecase,
  });

  MovieDetailModel? _movieDetail;
  MovieDetailModel? get movieDetail => _movieDetail;

  Future<Either<Failure, MovieDetailModel>> getMovieDetails(
    String movieId,
  ) async {
    _setMovieDetailState(MovieDetailState.isLoading);
    final res = await movieDetailsUsecase.call(movieId);

    return res.fold(
      (l) {
        _setMovieDetailState(MovieDetailState.isError);
        return Left(l);
      },
      (r) {
        _movieDetail = r;
        notifyListeners();
        _setMovieDetailState(MovieDetailState.isDone);
        return Right(r);
      },
    );
  }

  MovieDetailState _movieDetailState = MovieDetailState.isDone;
  MovieDetailState get movieDetailState => _movieDetailState;

  void _setMovieDetailState(MovieDetailState state) {
    _movieDetailState = state;
    notifyListeners();
  }
}

enum MovieDetailState { isLoading, isError, isDone }
