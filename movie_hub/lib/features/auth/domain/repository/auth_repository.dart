import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

abstract class AuthRepository {

   Future<Either<Failure, AuthResultEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthResultEntity>> register(
    SignUpParamsModel signUpParams,
  );

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> forgotPassword(String email);
}
