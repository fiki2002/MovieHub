import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

void setUpWatchMoviesLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  /// Data Source
  getIt.registerLazySingleton<WatchMoviesRemoteDataSource>(
    () => WatchMoviesRemoteDataSourceImpl(),
  );

  /// Repository
  getIt.registerLazySingleton<WatchMoviesRepo>(
    () => WatchMoviesRepoImpl(
      watchMovieDataSource: getIt<WatchMoviesRemoteDataSource>(),
    ),
  );

  /// Usecase
  getIt.registerLazySingleton<WatchMoviesUsecase>(
    () => WatchMoviesUsecase(
      watchMoviesRepo: getIt<WatchMoviesRepo>(),
    ),
  );
}
