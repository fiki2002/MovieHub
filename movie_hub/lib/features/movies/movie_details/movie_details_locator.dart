import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

void setUpMovieLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  /// Data Source
  getIt.registerLazySingleton<MovieDetailsRemoteDataSource>(
    () => MovieDetailRemoteDataSourceImpl(),
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

  ///Notifier
  getIt.registerLazySingleton<MovieDetailsNotifier>(
    () => MovieDetailsNotifier(
      movieDetailsUsecase: getIt<MovieDetailUsecase>(),
    ),
  );
}
