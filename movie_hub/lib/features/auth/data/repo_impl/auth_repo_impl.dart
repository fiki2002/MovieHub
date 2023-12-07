import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

class AuthRepoImpl extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepoImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;

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
  Future<Either<Failure, void>> forgotPassword(String email) async {
    return _handleAuthOperation(() => _authDataSource.forgotPassword(email));
  }

  @override
  Future<Either<Failure, AuthResultEntity>> login({
    required String email,
    required String password,
  }) async {
    return _handleAuthOperation(() => _authDataSource.login(email, password));
  }

  @override
  Future<Either<Failure, AuthResultEntity>> register(
    SignUpParamsModel signUpParams,
  ) async {
    return _handleAuthOperation(() => _authDataSource.signUp(signUpParams));
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return _handleAuthOperation(() => _authDataSource.logOut());
  }

  @override
  Future<Either<Failure, bool>> isUserLoggedIn() async {
    return _handleAuthOperation(() => _authDataSource.isLoggedIn());
  }
}
