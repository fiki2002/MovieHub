import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
  });

  @override
  FutureOr<Either<Failure, MoviesModel>> getPopularMovies(int page) {
    return _handleMovieOperation(
      () => homeRemoteDataSource.getPopularMovies(page),
    );
  }

  @override
  FutureOr<Either<Failure, MoviesModel>> getTopRatedMovies(int page) {
    return _handleMovieOperation(
      () => homeRemoteDataSource.getRatedMovies(page),
    );
  }

  @override
  FutureOr<Either<Failure, MoviesModel>> getTrendingMovies(
    String timeWindow,
    int page,
  ) {
    return _handleMovieOperation(
      () => homeRemoteDataSource.getTrendingMovies(timeWindow, page),
    );
  }

  @override
  FutureOr<Either<Failure, MoviesModel>> getUpcomingMovies(int page) {
    return _handleMovieOperation(
      () => homeRemoteDataSource.getUpcomingMovie(page),
    );
  }

  Future<Either<Failure, T>> _handleMovieOperation<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Either.right(result);
    } on FirebaseAuthException catch (e, s) {
      AppLogger.log('Error From Firebase: $e : Stack Trace $s');
      return Either.left(AuthFirebaseException(e.code));
    } on SocketException {
      return const Left(BaseFailures(message: ErrorText.noInternet));
    } catch (e) {
      AppLogger.log(e);

      if (e is BaseFailures) {
        return Either.left(BaseFailures(message: e.message));
      }

      return Either.left(
        const BaseFailures(message: 'Something went wrong, Try again!'),
      );
    }
  }
}
