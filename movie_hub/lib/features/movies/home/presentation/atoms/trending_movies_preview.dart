import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:provider/provider.dart';

class TrendingMoviesPreview extends StatelessWidget {
  const TrendingMoviesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingMoviesNotifier = context.watch<TrendingMoviesNotifier>();

    return trendingMoviesNotifier.state.when(
      done: (MoviesModel trendingMovies) {
        return Stack(
          children: [
            SizedBox(
              height: screenHeight * .5,
              child: Stack(
                children: [
                  CarouselSlider.builder(
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
                      final String url =
                          trendingMovies.results?[index].backdropPath ?? '';
                      final String title =
                          trendingMovies.results?[index].originalName ?? '';

                      return HomeImagePreview(
                        url: url,
                        title: title,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
      error: (message) => const ShimmerWidget(),
      loading: () => const ShimmerWidget(),
    );
  }
}
