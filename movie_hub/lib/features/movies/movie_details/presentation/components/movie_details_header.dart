import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MovieDetailsHeader extends StatefulWidget {
  const MovieDetailsHeader({super.key, required this.movies});

  final MovieDetailsParams movies;

  @override
  State<MovieDetailsHeader> createState() => _MovieDetailsHeaderState();
}

class _MovieDetailsHeaderState extends State<MovieDetailsHeader> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    PreCacheImage.loadImages(
      backDrop: widget.movies.movieResults?.backdropPath ?? '',
      posterPath: widget.movies.movieResults?.posterPath ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:
          '${widget.movies.genreTitle}${widget.movies.movieResults?.name}${widget.movies.movieResults?.id}',
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
      child: Stack(
        children: [
          SizedBox(
            height: screenHeight * .3,
            child: Stack(
              children: [
                SizedBox(
                  height: screenHeight * .2,
                  child: ImageWidget(
                    imageTypes: ImageTypes.network,
                    fit: BoxFit.cover,
                    width: screenWidth,
                    imageUrl: widget.movies.movieResults?.backdropPath ?? '',
                    loader: ShimmerWidget(
                      highlightColor: Colors.grey[200]!,
                      baseColor: kcBackground.withOpacity(.1),
                    ),
                  ),
                ),
                Positioned(
                  bottom: kGlobalPadding,
                  left: kfsExtraLarge,
                  child: MovieCardTile(
                    imageUrl: widget.movies.movieResults?.posterPath ?? '',
                    onTap: () {},
                    height: 130,
                  ),
                ),
                Positioned(
                  top: kfs50,
                  left: kfsExtraLarge,
                  child: GestureDetector(
                    onTap: goBack,
                    child: CircleAvatar(
                      radius: kfsExtraLarge,
                      backgroundColor: kcGrey.withOpacity(.3),
                      child: arrowLeftIcon.svg,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
