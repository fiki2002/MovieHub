import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/movies/shared_widgets/movies_grid.dart';
import 'package:provider/provider.dart';

class SearchMoviesGrid extends StatelessWidget {
  const SearchMoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchNotifier>(
      builder: (_, viewModel, __) {
        return Visibility(
          visible: viewModel.searchedMovies.isNotEmpty,
          replacement: const MovieNotFound(),
          child: switch (viewModel.searchState) {
            SearchState.isLoading => const LoadingWidget(),
            SearchState.isDone => NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification &&
                      notification.metrics.extentAfter == 0) {
                    context.search.searchMovies(
                      shouldFetch: true,
                    );
                  }
                  return false;
                },
                child: MoviesGrid(
                  movies: viewModel.searchedMovies,
                  genreTitle: 'Search',
                ),
              ),
            SearchState.isError => PageErrorWidget(
                onTap: () => viewModel.updateSearchValue(
                  viewModel.searchedValue.toString(),
                ),
              ),
          },
        );
      },
    );
  }
}
