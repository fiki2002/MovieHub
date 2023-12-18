import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:movie_hub/features/movies/home/presentation/atoms/popular_movies_Section.dart';
import 'package:movie_hub/features/movies/home/presentation/atoms/top_rated_movies_section.dart';
import 'package:movie_hub/features/movies/home/presentation/atoms/trending_for_the_day.dart';
import 'package:movie_hub/features/movies/home/presentation/atoms/trending_for_the_week_section.dart';
import 'package:movie_hub/features/movies/home/presentation/atoms/upcoming_movies_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const route = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      usePadding: false,
      safeAreaTop: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TrendingMoviesPreview(),
          PopularMoviesSection(),
          TrendingForTheDaySection(),
          TopRatedMoviesSection(),
          UpcomingMoviesSection(),
          TrendingForTheWeekSection(),
        ],
      ),
      useSingleScroll: true,
    );
  }

  void init() {
    context.fetchProfile.fetchProfileDetails();
    context.trendingMovies.getTrendingMoviesForTheDay();
    context.trendingForTheWeek.getTrendingMoviesForTheWeek();
    context.upcomingMovies.getUpcomingMovies();
    context.popularMovies.getPopularMovies();
    context.topRated.getTopRatedMovies();
  }
}
