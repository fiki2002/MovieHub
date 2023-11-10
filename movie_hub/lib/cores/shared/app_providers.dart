import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


final GetIt getIt = SetUpLocators.getIt;


List<SingleChildWidget> _providers = [
  ChangeNotifierProvider.value(value: NavBarNotifier()),
  ChangeNotifierProvider.value(value: getIt<TrendingMoviesNotifier>()),
];

List<SingleChildWidget> get providers => _providers;
