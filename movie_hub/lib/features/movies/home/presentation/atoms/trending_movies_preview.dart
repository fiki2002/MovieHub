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
  bool loadingTimePassed = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (mounted) {
          setState(() {
            loadingTimePassed = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final trendingMoviesNotifier = context.watch<TrendingMoviesNotifier>();
    return !loadingTimePassed
        ? Column(
            children: [
              vSpace(screenHeight * .4),
              const LoadingWidget(),
            ],
          )
        : trendingMoviesNotifier.state.data == null
            ? PageErrorWidget(
                onTap: () {
                  context.trendingMovies.getTrendingMoviesForTheDay();
                  context.popularMovies.getPopularMovies();
                  context.topRated.getTopRatedMovies();
                  context.upcomingMovies.getUpcomingMovies();
                  context.trendingForTheWeek.getTrendingMoviesForTheWeek();
                },
              )
            : trendingMoviesNotifier.state.when(
                done: (trendingMovies) {
                  return Stack(
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
                            autoPlayInterval:
                                Duration(seconds: kMinute.toInt()),
                          ),
                          itemBuilder: (context, index, realIndex) {
                            final String url =
                                trendingMovies[index].backdropPath ?? '';
                            final String title =
                                trendingMovies[index].originalName ?? '';

                            return HomeImagePreview(
                              url: url,
                              title: title,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                error: (message) => const ShimmerWidget(),
                loading: () => LoadingWidget(
                  radius: sr(kfsTiny),
                ),
              );
  }
}
