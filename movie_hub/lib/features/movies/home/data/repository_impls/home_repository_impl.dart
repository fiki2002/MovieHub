import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
  });

  @override
  FutureOr<NotifierState<MoviesModel>> getTrendingMovies(
    String timeWindow,
    int page
  ) {
    return convert(
      () => homeRemoteDataSource.getTrendingMovies(timeWindow, page),
    );
  }

  @override
  FutureOr<NotifierState<MoviesModel>> getPopularMovies(int page) {
    return convert(
      () => homeRemoteDataSource.getPopularMovies(page),
    );
  }

  @override
  FutureOr<NotifierState<MoviesModel>> getTopRatedMovies(int page) {
    return convert(
      () => homeRemoteDataSource.getRatedMovies(page),
    );
  }
  
  @override
  FutureOr<NotifierState<MoviesModel>> getUpcomingMovies(int page) {
    return convert(
      () => homeRemoteDataSource.getUpcomingMovie(page),
    );
  }
}
