import 'package:get_it/get_it.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SetUpLocators {
  static const SetUpLocators _instance = SetUpLocators._();
  const SetUpLocators._();

  factory SetUpLocators() => _instance;

  static final getIt = GetIt.instance;

  static void init() {
    //! ****** NavBar Locator ****** !//
    setUpNavBarLocator();

    //! ****** Home Locator ****** !//
    setUpHomeLocator();

    //! ****** Movie Details Locator ****** !//
    setUpMovieLocator();
  }
}
