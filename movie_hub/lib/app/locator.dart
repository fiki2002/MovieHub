import 'package:get_it/get_it.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';

class SetUpLocators {
  static const SetUpLocators _instance = SetUpLocators._();
  const SetUpLocators._();

  factory SetUpLocators() => _instance;

  static final getIt = GetIt.instance;

  static void init() {
    //! ****** NavBar Locator ****** !//
    setUpNavBarLocator();

    //! ***** Auth Locator ****** !//
    setUpAuthLocator();

    //! ****** Home Locator ****** !//
    setUpHomeLocator();

    //! ****** Movie Details Locator ****** !//
    setUpMovieLocator();

    //! ****** Search Movies Locator ****** !//
    setUpSearchLocator();

    //! ******* Profile ******** !//
    setUpProfileLocator();

    //! ******* WatchList ******** !//
    setUpWatchListLocator();
  }
}
