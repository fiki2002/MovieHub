import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/data/model/movie_details_model.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';

class WatchListRepoImpl extends WatchListRepo {
  final WatchListDataSource _watchListDataSource;

  WatchListRepoImpl({
    required watchListDataSource,
  }) : _watchListDataSource = watchListDataSource;

  @override
  Future<Either<Failure, BaseEntity>> addToWatchList(String movieId) async {
    try {
      final BaseModel result =
          await _watchListDataSource.addToWatchList(movieId);

      return Either.right(result);
    } on SocketFailures {
      return const Left(BaseFailures(message: ErrorText.noInternet));
    } catch (e, s) {
      AppLogger.log(e, s);

      if (e is BaseFailures) {
        return Either.left(BaseFailures(message: e.message));
      }

      return Either.left(BaseFailures(message: e.toString()));
    }
  }

  @override
  FutureOr<NotifierState<List<String>>> watchListMovieIds() {
    return convert(
      () => _watchListDataSource.getWatchListIds(),
    );
  }

  @override
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(String movieId) {
    return _handleAuthOperation(
      () => _watchListDataSource.getWatchListMovieDetail(movieId),
    );
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

  @override
  Future<Either<Failure, BaseEntity>> removeFromWatchList(
      String movieId) async {
    try {
      final BaseModel result =
          await _watchListDataSource.removeFromWatchList(movieId);

      return Either.right(result);
    } on SocketFailures {
      return const Left(BaseFailures(message: ErrorText.noInternet));
    } catch (e, s) {
      AppLogger.log(e, s);

      if (e is BaseFailures) {
        return Either.left(BaseFailures(message: e.message));
      }

      return Either.left(BaseFailures(message: e.toString()));
    }
  }
}
