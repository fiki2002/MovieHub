import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

void setUpMovieLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  /// Data Source
  getIt.registerLazySingleton<MovieDetailsRemoteDataSource>(
    () => MovieDetailRemoteDataSourceImpl(firebaseHelper: FirebaseHelper()),
  );

  /// Repository
  getIt.registerLazySingleton<MovieDetailRepository>(
    () => MovieDetailRepoImpl(
      movieDetailsDataSource: getIt<MovieDetailsRemoteDataSource>(),
    ),
  );

  /// Usecase
  getIt.registerLazySingleton<MovieDetailUsecase>(
    () => MovieDetailUsecase(
      movieDetailRepo: getIt<MovieDetailRepository>(),
    ),
  );

  getIt.registerLazySingleton<ImagesUsecase>(
    () => ImagesUsecase(
      movieDetailRepo: getIt<MovieDetailRepository>(),
    ),
  );

  getIt.registerLazySingleton<SimilarMovieUsecase>(
    () => SimilarMovieUsecase(
      movieDetailRepo: getIt<MovieDetailRepository>(),
    ),
  );

  getIt.registerLazySingleton<CheckIfMovieIsAUsecase>(
    () => CheckIfMovieIsAUsecase(
      movieDetailRepo: getIt<MovieDetailRepository>(),
    ),
  );

  getIt.registerLazySingleton<CheckMovieWatchListStatusNotifier>(
    () => CheckMovieWatchListStatusNotifier(
      checkWatchListStatus: getIt<CheckIfMovieIsAUsecase>(),
    ),
  );
}
