import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

void setUpAuthLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  /// Data source
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      firebaseHelper: FirebaseHelper(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(
      authDataSource: getIt<AuthDataSource>(),
    ),
  );

  /// Usecase
  getIt.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(
      authenticationRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      authenticationRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<LogOutUsecase>(
    () => LogOutUsecase(
      authenticationRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<ForgotPasswordUsecase>(
    () => ForgotPasswordUsecase(
      authenticationRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<CheckUserLoginStatusUsecase>(
    () => CheckUserLoginStatusUsecase(
      authenticationRepository: getIt<AuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<AuthNotifier>(
    () => AuthNotifier(
      forgotPasswordUsecase: getIt<ForgotPasswordUsecase>(),
      logInUsecase: getIt<LoginUsecase>(),
      signUpUsecase: getIt<SignUpUsecase>(),
      checkUserStatusUsecase: getIt<CheckUserLoginStatusUsecase>(),
    ),
  );
}
