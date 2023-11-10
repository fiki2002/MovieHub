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
  ) {
    return convert(
      () => homeRemoteDataSource.getTrendingMovies(timeWindow),
    );
  }

  @override
  FutureOr<NotifierState<MoviesModel>> getPopularMovies() {
    return convert(
      () => homeRemoteDataSource.getPopularMovies(),
    );
  }

  @override
  FutureOr<NotifierState<MoviesModel>> getTopRatedMovies() {
    return convert(
      () => homeRemoteDataSource.getRatedMovies(),
    );
  }
  
  @override
  FutureOr<NotifierState<MoviesModel>> getUpcomingMovies() {
    return convert(
      () => homeRemoteDataSource.getUpcomingMovie(),
    );
  }
}
