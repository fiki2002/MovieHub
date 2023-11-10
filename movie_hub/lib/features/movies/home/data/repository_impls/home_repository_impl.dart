import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
  });

  @override
  FutureOr<NotifierState<TrendingMoviesModel>> getTrendingMovies(
    String timeWindow,
  ) {
    return convert(() => homeRemoteDataSource.getTrendingMovies(timeWindow));
  }
}
