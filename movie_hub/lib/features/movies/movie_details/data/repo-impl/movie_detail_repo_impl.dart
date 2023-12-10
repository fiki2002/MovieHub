import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MovieDetailRepoImpl extends MovieDetailRepository {
  final MovieDetailsRemoteDataSource movieDetailsDataSource;
  MovieDetailRepoImpl({
    required this.movieDetailsDataSource,
  });

  @override
  FutureOr<NotifierState<MovieDetailModel>> getMovieDetails(String movieId) {
    return convertWithArgument(
      movieDetailsDataSource.getMovieDetails,
      movieId,
    );
  }

  @override
  FutureOr<NotifierState<ImageModel>> getImages(String movieId) {
    return convertWithArgument(
      movieDetailsDataSource.getImages,
      movieId,
    );
  }

  @override
  FutureOr<NotifierState<MoviesModel>> getSimilarMovies(String movieId) {
    return convertWithArgument(
      movieDetailsDataSource.getSimilarMovies,
      movieId,
    );
  }
  
  @override
  Future<Either<Failure, bool>> isMovieAWatchList(String movieId) {
    return _handleAuthOperation(()=> movieDetailsDataSource.checkIfMovieIdHasBeenWatchListed(movieId));
  }

    Future<Either<Failure, T>> _handleAuthOperation<T>(
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
