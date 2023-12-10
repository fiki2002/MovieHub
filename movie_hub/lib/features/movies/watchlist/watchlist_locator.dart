import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/presentation/notifier/watch_list_details_notifier.dart';
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

  getIt.registerLazySingleton<GetWatchListMovieIdsUsecase>(
    () => GetWatchListMovieIdsUsecase(
      watchListRepo: getIt<WatchListRepo>(),
    ),
  );
   getIt.registerLazySingleton<WatchListDetailsUsecase>(
    () => WatchListDetailsUsecase(
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

  getIt.registerLazySingleton<WatchListNotifier>(
    () => WatchListNotifier(
     watchListDetailsUsecase: getIt<WatchListDetailsUsecase>(),
    ),
  );

}
