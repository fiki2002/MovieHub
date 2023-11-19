import 'dart:async';

import 'package:movie_hub/cores/cores.dart';

abstract class WatchMoviesRepo {
  FutureOr<NotifierState<String>> watchMovie(String movieId);
}
