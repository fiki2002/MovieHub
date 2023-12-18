import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileDataSource _profileDataSource;
  
  ProfileRepoImpl({required profileDataSource})
      : _profileDataSource = profileDataSource;

  @override
  Future<Either<Failure, BaseEntity>> updateAvatar(String avatarUrl) async {
    return _handleAuthOperation(
        () => _profileDataSource.updateAvatarUrl(avatarUrl));
  }

  @override
  Future<Either<Failure, List<String>>> fetchAvatars() {
    return _handleAuthOperation(() => _profileDataSource.getAvatars());
  }

  @override
  Future<Either<Failure, UserDetailsModel>> fetchProfileDetails() {
    return _handleAuthOperation(() => _profileDataSource.fetchProfileDetails());
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
