import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class UpcomingMoviesSection extends StatelessWidget {
  const UpcomingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingMoviesNotifier>(
      builder: (_, viewModel, __) {
        return viewModel.upcomingMovies?.isEmpty ?? true
            ? const SizedBox.shrink()
            : SizedBox(
                child: switch (viewModel.upcomingMoviesState) {
                  UpcomingMoviesState.isLoading => const SizedBox.shrink(),
                  UpcomingMoviesState.isError => const SizedBox.shrink(),
                  UpcomingMoviesState.isDone => GenreCardWidget(
                      title: 'UPCOMING MOVIES',
                      movies: viewModel.upcomingMovies,
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter == 0) {
                          context.upcomingMovies.getUpcomingMovies(
                            shouldFetch: true,
                          );
                        }
                        return true;
                      },
                    ),
                },
              );
      },
    );
  }
}
