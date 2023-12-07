
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/nav_bar/nav_bar.dart';


void setUpNavBarLocator() {

  getIt.registerLazySingleton<NavBarNotifier>(() => NavBarNotifier());
}
