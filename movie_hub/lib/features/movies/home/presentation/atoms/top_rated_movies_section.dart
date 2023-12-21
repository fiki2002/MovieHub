import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:movie_hub/features/movies/shared_widgets/widgets.dart';
import 'package:provider/provider.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TopRatedMoviesNotifier>(
      builder: (_, viewModel, __) {
        return (viewModel.topRatedMovies?.isEmpty ?? true)
            ? const SizedBox.shrink()
            : SizedBox(
                child: switch (viewModel.topRatedMoviesState) {
                  TopRatedMoviesState.isLoading => const SizedBox.shrink(),
                  TopRatedMoviesState.isError => const SizedBox.shrink(),
                  TopRatedMoviesState.isDone => GenreCardWidget(
                      title: 'TOP RATED',
                      movies: viewModel.topRatedMovies,
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter == 0) {
                          context.topRated.getTopRatedMovies(
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
