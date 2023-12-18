import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/discover/presentation/notifier/discover_movies_notifier.dart';
import 'package:movie_hub/features/movies/shared_widgets/movies_grid.dart';
import 'package:provider/provider.dart';

class DiscoverMoviesSection extends StatefulWidget {
  const DiscoverMoviesSection({super.key});

  @override
  State<DiscoverMoviesSection> createState() => _DiscoverMoviesSectionState();
}

class _DiscoverMoviesSectionState extends State<DiscoverMoviesSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.discoverMovies.discoverMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverMoviesNotifier>(
      builder: (_, viewModel, __) {
        return switch (viewModel.discoverMovieState) {
          DiscoverMovieState.error => PageErrorWidget(
              onTap: () {
                context.discoverMovies.discoverMovies();
              },
            ),
          DiscoverMovieState.idle => NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification &&
                    notification.metrics.extentAfter == 0) {
                  context.discoverMovies.discoverMovies(
                    shouldFetch: true,
                  );
                }
                return true;
              },
              child: MoviesGrid(
                movies: viewModel.discoveredMovies,
                genreTitle: 'Discover',
              ),
            ),
          DiscoverMovieState.loading => const LoadingWidget(),
        };
      },
    );
  }
}
