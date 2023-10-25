import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/features/movie_dashboard/nav_bar/nav_bar.dart';


void setUpNavBarLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  getIt.registerLazySingleton<NavBarNotifier>(() => NavBarNotifier());
}
