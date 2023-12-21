import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class TrendingForTheWeekSection extends StatelessWidget {
  const TrendingForTheWeekSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingForTheWeekNotifier>(
      builder: (_, viewModel, __) {
        return viewModel.trendingForTheWeekMovies?.isEmpty??true
            ? const SizedBox.shrink()
            : SizedBox(
                child: switch (viewModel.trendingForTheWeekState) {
                  TrendingForTheWeekState.isLoading => const SizedBox.shrink(),
                  TrendingForTheWeekState.isError => const SizedBox.shrink(),
                  TrendingForTheWeekState.isDone => GenreCardWidget(
                      title: 'TRENDING FOR THE WEEK',
                      movies: viewModel.trendingForTheWeekMovies,
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter == 0) {
                          context.trendingForTheWeek
                              .getTrendingMoviesForTheWeek(
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
