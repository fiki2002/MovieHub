import 'package:get_it/get_it.dart';
import 'package:movie_hub/features/movie_dashboard/nav_bar/change_notifier/nav_bar_notifier.dart';

import '../../../app/locator.dart';

void setUpNavBarLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  getIt.registerLazySingleton<NavBarNotifier>(() => NavBarNotifier());
}
