import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../../cores/errors/failures.dart';
import '../../../../../cores/usecase_interface/base_usecase.dart';
import '../entities/trending_movies_entity.dart';
import '../repository/home_repository.dart';

class GetTrendingMoviesUsecase
    implements UseCaseFuture<Failure, List<TrendingMovieEntity>, NoParams> {

  const GetTrendingMoviesUsecase({required this.trendingMoviesRepository});

  final TrendingMoviesRepository trendingMoviesRepository;
  
  @override
  FutureOr<Either<Failure, List<TrendingMovieEntity>>> call(
      NoParams params) async {
    return await trendingMoviesRepository.getTrendingMovies();
  }
}
