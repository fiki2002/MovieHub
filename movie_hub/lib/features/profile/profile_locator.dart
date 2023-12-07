import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/domain/usecase/fetch_profile_details_usecase.dart';
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

  getIt.registerLazySingleton<FetchProfileNotifier>(
    () => FetchProfileNotifier(
      fetchProfileUsecase: getIt<FetchProfileDetailsUsecase>(),
    ),
  );
}
