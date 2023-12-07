import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

class CheckUserLoginStatusUsecase
    implements UseCaseFuture<Failure, bool, NoParams> {
  final AuthRepository _authenticationRepository;

  CheckUserLoginStatusUsecase({required AuthRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _authenticationRepository.isUserLoggedIn();
  }
}
