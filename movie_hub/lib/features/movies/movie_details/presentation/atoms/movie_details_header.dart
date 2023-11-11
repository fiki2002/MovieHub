import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({super.key, required this.movies});

  final MovieDetailsParams movies;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:
          '${movies.genreTitle}${movies.movieResults?.name}${movies.movieResults?.id}',
      placeholderBuilder: (context, heroSize, child) {
        return Opacity(
          opacity: 0.6,
          child: child,
        );
      },
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        final Hero toHero = toHeroContext.widget as Hero;
        return RotationTransition(
          turns: animation,
          child: toHero.child,
        );
      },
      child: SizedBox(
        height: screenHeight * .3,
        child: Stack(
          children: [
            SizedBox(
              height: screenHeight * .2,
              child: ImageWidget(
                imageTypes: ImageTypes.network,
                fit: BoxFit.cover,
                width: screenWidth,
                imageUrl: movies.movieResults?.backdropPath ?? '',
                loader: const ShimmerWidget(),
              ),
            ),
            Positioned(
              bottom: 25,
              left: 20,
              child: MovieCardTile(
                imageUrl: movies.movieResults?.posterPath ?? '',
                onTap: () {},
                height: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
