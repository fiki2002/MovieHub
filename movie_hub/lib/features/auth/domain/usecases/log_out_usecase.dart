import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

class LogOutUsecase implements UseCaseVoid<Failure, NoParams> {
  final AuthRepository _authenticationRepository;

  const LogOutUsecase({required AuthRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  @override
  FutureOr<Either<Failure, void>> call(NoParams params) async {
    return await _authenticationRepository.logout();
  }
}
