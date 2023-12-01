import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class SearchMoviesGrid extends StatelessWidget {
  const SearchMoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final searchMoviesNotifier = context.watch<SearchNotifier>();
    return searchMoviesNotifier.state.when(
      done: (searchedMovies) {
        return Visibility(
          visible: searchedMovies.isNotEmpty,
          replacement: const MovieNotFound(),
          child: switch (searchMoviesNotifier.isLoading) {
            true => const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              ),
            false => Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification &&
                        notification.metrics.extentAfter == 0) {
                      searchMoviesNotifier.searchMovies(
                        shouldFetch: true,
                      );
                    }
                    return false;
                  },
                  child: MoviesGrid(
                    movies: searchedMovies,
                    genreTitle: 'Search',
                  ),
                ),
              ),
          },
        );
      },
      error: (e) => Text(e.toString()),
      loading: () => const CupertinoActivityIndicator(),
    );
  }
}
