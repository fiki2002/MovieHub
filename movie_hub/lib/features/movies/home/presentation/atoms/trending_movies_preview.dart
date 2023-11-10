import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TrendingMoviesPreview extends StatelessWidget {
  const TrendingMoviesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingMoviesNotifier = context.watch<TrendingMoviesNotifier>();

    return trendingMoviesNotifier.state.when(
      done: (trendingMovies) {
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

                      return _buildImagePreview(
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
      error: (message) => Container(
        height: 20,
        color: Colors.red,
        child: Text('$message'),
      ),
      loading: () => const CircularProgressIndicator.adaptive(),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: screenHeight * .5,
      ),
    );
  }

  Widget _buildImagePreview({required String url, required String title}) {
    return Stack(
      children: [
        SizedBox(
          height: screenHeight * .5,
          child: ImageWidget(
            imageTypes: ImageTypes.network,
            imageUrl: url,
            width: screenWidth,
            fit: BoxFit.cover,
            loader: _buildShimmer(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * .04,
          left: screenWidth * .2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: screenWidth * .6,
                child: TextWidget(
                  title,
                  textAlign: TextAlign.center,
                  textColor: kcWhiteColor,
                  fontSize: kfs30,
                  fontFamily: playFair,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
