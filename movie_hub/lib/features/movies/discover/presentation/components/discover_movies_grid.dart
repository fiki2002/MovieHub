import 'package:flutter/cupertino.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class DiscoverMoviesSection extends StatelessWidget {
  const DiscoverMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverMoviesNotifier = context.watch<DiscoverMoviesNotifier>();

    return discoverMoviesNotifier.state.when(
      done: (discoveredMovies) {
        return Expanded(
          child: NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.extentAfter == 0) {
                discoverMoviesNotifier.discoverMovies(
                  shouldFetch: true,
                );
              }
              return true;
            },
            child: MoviesGrid(
              movies: discoveredMovies,
              genreTitle: 'Discover',
            ),
          ),
        );
      },
      error: (e) => Text(e.toString()),
      loading: () => const CupertinoActivityIndicator(),
    );
  }
}
