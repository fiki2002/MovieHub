import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';

class WatchListRepoImpl extends WatchListRepo {
  final WatchListDataSource _watchListDataSource;

  WatchListRepoImpl({
    required watchListDataSource,
  }) : _watchListDataSource = watchListDataSource;

  @override
  Future<Either<Failure, BaseEntity>> addToWatchList(String movieId) async {
    return _handleWatchListOperation(
      () => _watchListDataSource.addToWatchList(movieId),
    );
  }

  @override
  FutureOr<Either<Failure, List<String>>> watchListMovieIds() {
    return _handleWatchListOperation(() => _watchListDataSource.getWatchListIds());
  }

  @override
  Future<Either<Failure, BaseEntity>> removeFromWatchList(
      String movieId) async {
    return _handleWatchListOperation(
      () => _watchListDataSource.removeFromWatchList(movieId),
    );
  }

  Future<Either<Failure, T>> _handleWatchListOperation<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final T result = await operation();
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
