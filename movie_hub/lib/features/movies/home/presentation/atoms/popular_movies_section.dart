import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/presentation/notifier/popular_movies_notifier.dart';
import 'package:movie_hub/features/movies/shared_widgets/genre_card_widget.dart';
import 'package:provider/provider.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PopularMoviesNotifier>(
      builder: (_, viewModel, __) {
        return viewModel.popularMovies?.isEmpty ?? true
            ? const SizedBox.shrink()
            : SizedBox(
                child: switch (viewModel.popularMovieState) {
                  PopularMovieState.isLoading => const SizedBox.shrink(),
                  PopularMovieState.isError => const SizedBox.shrink(),
                  PopularMovieState.isDone => GenreCardWidget(
                      title: 'POPULAR MOVIES',
                      movies: viewModel.popularMovies,
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter == 0) {
                          context.popularMovies.getPopularMovies(
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
