import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

class LoginUsecase
    implements UseCaseFuture<Failure, AuthResultEntity, LoginDataParams> {
  final AuthRepository _authenticationRepository;

  LoginUsecase({required AuthRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, AuthResultEntity>> call(LoginDataParams login) async {
    return await _authenticationRepository.login(
      email: login.email,
      password: login.password,
    );
  }
}

class LoginDataParams {
  final String email;
  final String password;

  LoginDataParams({
    required this.email,
    required this.password,
  });
}
