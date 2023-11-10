import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/presentation/notifier/upcoming_movies_notifier.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const route = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      usePadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _trendingMoviesPreview,
          _popularMovies,
          _topRated,
          _upcomingMovies,
        ],
      ),
      useSingleScroll: true,
    );
  }

  Widget get _trendingMoviesPreview {
    return const TrendingMoviesPreview();
  }

  Widget get _popularMovies {
    final popularMoviesNotifier = context.watch<PopularMoviesNotifier>();

    return popularMoviesNotifier.state.when(
      done: (MoviesModel popularMovies) => GenreCardWidget(
        title: 'POPULAR MOVIES',
        movies: popularMovies.results,
      ),
      error: (message) => Text(message.toString()),
      loading: () => const SizedBox.shrink(),
    );
  }

  Widget get _topRated {
    final topRatedMoviesNotifier = context.watch<TopRatedMoviesNotifier>();

    return topRatedMoviesNotifier.state.when(
      done: (topRatedMovies) => GenreCardWidget(
        title: 'TOP RATED',
        movies: topRatedMovies.results,
      ),
      error: (message) => Text(message.toString()),
      loading: () => const SizedBox.shrink(),
    );
  }

  Widget get _upcomingMovies {
    final upcomingMoviesNotifier = context.watch<UpcomingMoviesNotifier>();

    return upcomingMoviesNotifier.state.when(
      done: (upcomingMovies) => GenreCardWidget(
        title: 'UPCOMING MOVIES',
        movies: upcomingMovies.results,
      ),
      error: (message) => Text(message.toString()),
      loading: () => const SizedBox.shrink(),
    );
  }
}
