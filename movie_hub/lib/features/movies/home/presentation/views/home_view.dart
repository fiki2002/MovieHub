import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const route = 'home';

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
    return const GenreCardWidget(
      title: 'POPULAR MOVIES',
    );
  }

  Widget get _topRated {
    return const GenreCardWidget(
      title: 'TOP RATED',
    );
  }

  Widget get _upcomingMovies {
    return const GenreCardWidget(
      title: 'UPCOMING MOVIES',
    );
  }
}
