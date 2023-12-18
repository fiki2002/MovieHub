import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class TrendingForTheDaySection extends StatelessWidget {
  const TrendingForTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingMoviesNotifier>(
      builder: (_, viewModel, __) {
        return viewModel.trendingMovies?.isEmpty??true
            ? const SizedBox.shrink()
            : SizedBox(
                child: switch (viewModel.trendingMoviesForTheDay) {
                  TrendingForTheDayState.isLoading => const LoadingWidget(),
                  TrendingForTheDayState.isError => const SizedBox.shrink(),
                  TrendingForTheDayState.isDone => GenreCardWidget(
                      title: 'TRENDING FOR THE DAY',
                      movies: viewModel.trendingMovies,
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter == 0) {
                          context.trendingMovies.getTrendingMoviesForTheDay(
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
