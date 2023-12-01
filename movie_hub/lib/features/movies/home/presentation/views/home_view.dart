import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
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
      safeAreaTop: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _trendingMoviesPreview,
          _popularMovies,
          _trendingMoviesForTheDay,
          _topRated,
          _upcomingMovies,
          _trendingMoviesForTheWeek,
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
      done: (popularMovies) => GenreCardWidget(
        title: 'POPULAR MOVIES',
        movies: popularMovies,
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            popularMoviesNotifier.getPopularMovies(
              shouldFetch: true,
            );
          }
          return true;
        },
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
        movies: topRatedMovies,
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            topRatedMoviesNotifier.getTopRatedMovies(
              shouldFetch: true,
            );
          }
          return true;
        },
      ),
      error: (message) => Text(message.toString()),
      loading: () => const SizedBox.shrink(),
    );
  }

  Widget get _trendingMoviesForTheDay {
    final trendingMoviesNotifier = context.watch<TrendingMoviesNotifier>();

    return trendingMoviesNotifier.state.when(
      done: (trendingMovies) => GenreCardWidget(
        title: 'TRENDING FOR THE DAY',
        movies: trendingMovies,
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            trendingMoviesNotifier.getTrendingMoviesForTheDay(
              shouldFetch: true,
            );
          }
          return true;
        },
      ),
      error: (message) => Text(message.toString()),
      loading: () => const SizedBox.shrink(),
    );
  }

  Widget get _trendingMoviesForTheWeek {
    final trendingMoviesForTheWeekNotifier =
        context.watch<TrendingForTheWeekNotifier>();

    return trendingMoviesForTheWeekNotifier.state.when(
      done: (trendingMovies) => GenreCardWidget(
        title: 'TRENDING FOR THE WEEK',
        movies: trendingMovies,
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            trendingMoviesForTheWeekNotifier.getTrendingMoviesForTheWeek(
              shouldFetch: true,
            );
          }
          return true;
        },
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
        movies: upcomingMovies,
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            upcomingMoviesNotifier.getUpcomingMovies(
              shouldFetch: true,
            );
          }
          return true;
        },
      ),
      error: (message) => Text(message.toString()),
      loading: () => const SizedBox.shrink(),
    );
  }
}
