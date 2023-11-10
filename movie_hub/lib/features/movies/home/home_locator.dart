import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

void setUpHomeLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  /// Data Source
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

  /// Repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );

  /// Usecase
  getIt.registerLazySingleton<TrendingMoviesUseCase>(
    () => TrendingMoviesUseCase(
      homeRepository: getIt<HomeRepository>(),
    ),
  );

  ///Notifier
  getIt.registerLazySingleton<TrendingMoviesNotifier>(
    () => TrendingMoviesNotifier(
      trendingMovieUsecase: getIt<TrendingMoviesUseCase>(),
    ),
  );
}
