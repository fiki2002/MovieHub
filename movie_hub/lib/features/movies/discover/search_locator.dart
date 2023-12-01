import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

void setUpSearchLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  /// Data Source
  getIt.registerLazySingleton<SearchMovieDataSource>(
    () => SearchMovieDataSourceImpl(),
  );

  /// Repository
  getIt.registerLazySingleton<SearchMoviesRepository>(
    () => SearchMovieImpl(
      searchMovieDataSource: getIt<SearchMovieDataSource>(),
    ),
  );

  /// Usecase
  getIt.registerLazySingleton<DiscoverMoviesUsecase>(
    () => DiscoverMoviesUsecase(
      searchMoviesRepo: getIt<SearchMoviesRepository>(),
    ),
  );
    getIt.registerLazySingleton<SearchMoviesUsecase>(
    () => SearchMoviesUsecase(
      searchMoviesRepo: getIt<SearchMoviesRepository>(),
    ),
  );

  /// Notifier
  getIt.registerLazySingleton<DiscoverMoviesNotifier>(
    () => DiscoverMoviesNotifier(
      discoverMoviesUsecase: getIt<DiscoverMoviesUsecase>(),
    ),
  );

    getIt.registerLazySingleton<SearchNotifier>(
    () => SearchNotifier(
      searchMovieUsecase: getIt<SearchMoviesUsecase>(),
    ),
  );

}
