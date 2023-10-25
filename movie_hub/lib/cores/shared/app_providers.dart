import 'package:movie_hub/features/movie_dashboard/movie_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> _providers = [
  ChangeNotifierProvider.value(value: NavBarNotifier()),
];

List<SingleChildWidget> get providers => _providers;
