import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

class SignUpUsecase
    implements UseCaseFuture<Failure, AuthResultEntity, SignUpParamsModel> {
  final AuthRepository _authenticationRepository;

  const SignUpUsecase({required AuthRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  @override
  FutureOr<Either<Failure, AuthResultEntity>> call(
    SignUpParamsModel params,
  ) async {
    return await _authenticationRepository.register(params);
  }
}
