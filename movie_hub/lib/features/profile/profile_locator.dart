import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

void setUpProfileLocator() {
  getIt.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSourceImpl(
      firebaseHelper: FirebaseHelper(),
    ),
  );

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      profileDataSource: getIt<ProfileDataSource>(),
    ),
  );

  getIt.registerLazySingleton<FetchProfileDetailsUsecase>(
    () => FetchProfileDetailsUsecase(
      profileRepo: getIt<ProfileRepo>(),
    ),
  );

  getIt.registerLazySingleton<FetchAvatarsUsecase>(
    () => FetchAvatarsUsecase(
      profileRepo: getIt<ProfileRepo>(),
    ),
  );

  getIt.registerLazySingleton<UpdateAvatarUsecase>(
    () => UpdateAvatarUsecase(
      profileRepo: getIt<ProfileRepo>(),
    ),
  );

  getIt.registerLazySingleton<FetchProfileNotifier>(
    () => FetchProfileNotifier(
      fetchProfileUsecase: getIt<FetchProfileDetailsUsecase>(),
    ),
  );

  getIt.registerLazySingleton<FetchAvatarNotifier>(
    () => FetchAvatarNotifier(
      fetchAvatarsUsecase: getIt<FetchAvatarsUsecase>(),
    ),
  );

  getIt.registerLazySingleton<UpdateAvatarNotifier>(
    () => UpdateAvatarNotifier(
      updateUsecase: getIt<UpdateAvatarUsecase>(),
    ),
  );
}
