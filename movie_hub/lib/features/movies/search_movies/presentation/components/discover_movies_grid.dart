import 'package:flutter/cupertino.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class DiscoverMoviesSection extends StatelessWidget {
  const DiscoverMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverMoviesNotifier = context.watch<DiscoverMoviesNotifier>();

    return discoverMoviesNotifier.state.when(
      done: (MoviesModel discoveredMovies) {
        return DiscoverMoviesGrid(movies: discoveredMovies.results);
      },
      error: (e) => Text(e.toString()),
      loading: () => const CupertinoActivityIndicator(),
    );
  }
}
