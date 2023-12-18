import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:provider/provider.dart';

class TrendingMoviesPreview extends StatefulWidget {
  const TrendingMoviesPreview({super.key});

  @override
  State<TrendingMoviesPreview> createState() => _TrendingMoviesPreviewState();
}

class _TrendingMoviesPreviewState extends State<TrendingMoviesPreview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingMoviesNotifier>(
      builder: (_, viewModel, __) {
        return Column(
          children: [
            switch (viewModel.trendingMoviesForTheDay) {
              TrendingForTheDayState.isLoading => Column(
                  children: [
                    vSpace(screenHeight * .4),
                    const LoadingWidget(),
                  ],
                ),
              TrendingForTheDayState.isError => PageErrorWidget(
                  onTap: () {
                    context.trendingMovies.getTrendingMoviesForTheDay();
                    context.popularMovies.getPopularMovies();
                    context.topRated.getTopRatedMovies();
                    context.upcomingMovies.getUpcomingMovies();
                    context.trendingForTheWeek.getTrendingMoviesForTheWeek();
                  },
                ),
              TrendingForTheDayState.isDone => Stack(
                  children: [
                    SizedBox(
                      height: screenHeight * .5,
                      child: CarouselSlider.builder(
                        itemCount: 10,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: screenHeight * .5,
                          autoPlay: true,
                          viewportFraction: 1,
                          enlargeFactor: .7,
                          autoPlayInterval: Duration(seconds: kMinute.toInt()),
                        ),
                        itemBuilder: (context, index, realIndex) {
                          final MovieResultsEntity? trendingMovies =
                              viewModel.trendingMovies?[index];

                          final String url = trendingMovies?.backdropPath ?? '';
                          final String title =
                              trendingMovies?.originalName ?? '';

                          return HomeImagePreview(
                            url: url,
                            title: title,
                          );
                        },
                      ),
                    ),
                  ],
                ),
            }
          ],
        );
      },
    );
  }
}
