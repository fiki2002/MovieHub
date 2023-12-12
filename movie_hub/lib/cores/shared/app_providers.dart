import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final GetIt getIt = SetUpLocators.getIt;

List<SingleChildWidget> _providers = [
  ChangeNotifierProvider(create: (_) => NavBarNotifier()),
  ChangeNotifierProvider(create: (_) => getIt<TrendingMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<PopularMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<TopRatedMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<UpcomingMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<TrendingForTheWeekNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<DiscoverMoviesNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<SearchNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<AuthNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<FetchProfileNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<FetchAvatarNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<UpdateAvatarNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<AddToWatchListNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<RemoveFromWatchListNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<GetWatchListMovieIdsNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<WatchListNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<MovieDetailsNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<ImageNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<SimilarMoviesNotifier>()),
  ChangeNotifierProvider(
    create: (_) => getIt<CheckMovieWatchListStatusNotifier>(),
  ),
];

List<SingleChildWidget> get providers => _providers;
