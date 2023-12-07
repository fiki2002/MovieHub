import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

class ForgotPasswordUsecase implements UseCaseVoid<Failure, String> {
  final AuthRepository _authenticationRepository;

  const ForgotPasswordUsecase(
      {required AuthRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  @override
  FutureOr<Either<Failure, void>> call(String params) async {
    return await _authenticationRepository.forgotPassword(params);
  }
}
