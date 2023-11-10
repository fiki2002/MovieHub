import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/features/movies/home/presentation/notifier/upcoming_movies_notifier.dart';
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
  getIt.registerLazySingleton<PopularMoviesUsecase>(
    () => PopularMoviesUsecase(
      homeRepository: getIt<HomeRepository>(),
    ),
  );

  getIt.registerLazySingleton<TopRatedMoviesUseCase>(
    () => TopRatedMoviesUseCase(
      homeRepository: getIt<HomeRepository>(),
    ),
  );

    getIt.registerLazySingleton<GetUpcomingMoviesUseCase>(
    () => GetUpcomingMoviesUseCase(
      homeRepository: getIt<HomeRepository>(),
    ),
  );

  ///Notifier
  getIt.registerLazySingleton<TrendingMoviesNotifier>(
    () => TrendingMoviesNotifier(
      trendingMovieUsecase: getIt<TrendingMoviesUseCase>(),
    ),
  );
  getIt.registerLazySingleton<PopularMoviesNotifier>(
    () => PopularMoviesNotifier(
      popularMoviesUsecase: getIt<PopularMoviesUsecase>(),
    ),
  );
  getIt.registerLazySingleton<TopRatedMoviesNotifier>(
    () => TopRatedMoviesNotifier(
      topRatedMoviesUseCase: getIt<TopRatedMoviesUseCase>(),
    ),
  );
    getIt.registerLazySingleton<UpcomingMoviesNotifier>(
    () => UpcomingMoviesNotifier(
      upcomingMoviesNotifier: getIt<GetUpcomingMoviesUseCase>(),
    ),
  );
}
