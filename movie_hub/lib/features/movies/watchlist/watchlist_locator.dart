import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';

void setUpWatchListLocator() {
  getIt.registerLazySingleton<WatchListDataSource>(
    () => WatchListDataSourceImpl(
      firebaseHelper: FirebaseHelper(),
    ),
  );

  getIt.registerLazySingleton<WatchListRepo>(
    () => WatchListRepoImpl(
      watchListDataSource: getIt<WatchListDataSource>(),
    ),
  );

  getIt.registerLazySingleton<AddToWatchListUsecase>(
    () => AddToWatchListUsecase(
      watchListRepo: getIt<WatchListRepo>(),
    ),
  );

  getIt.registerLazySingleton<RemoveFromWatchListUsecase>(
    () => RemoveFromWatchListUsecase(
      watchListRepo: getIt<WatchListRepo>(),
    ),
  );

  getIt.registerLazySingleton<GetWatchListMovieIdsUsecase>(
    () => GetWatchListMovieIdsUsecase(
      watchListRepo: getIt<WatchListRepo>(),
    ),
  );

  getIt.registerLazySingleton<AddToWatchListNotifier>(
    () => AddToWatchListNotifier(
      addToWatchListNotifier: getIt<AddToWatchListUsecase>(),
    ),
  );

  getIt.registerLazySingleton<GetWatchListMovieIdsNotifier>(
    () => GetWatchListMovieIdsNotifier(
      watchListMovieIdUsecase: getIt<GetWatchListMovieIdsUsecase>(),
    ),
  );

   getIt.registerLazySingleton<RemoveFromWatchListNotifier>(
    () => RemoveFromWatchListNotifier(
      removeFromWatchListNotifier: getIt<RemoveFromWatchListUsecase>(),
    ),
  );
}
