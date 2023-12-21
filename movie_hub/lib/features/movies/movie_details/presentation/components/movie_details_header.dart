import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:movie_hub/features/movies/shared_widgets/widgets.dart';

class MovieDetailsHeader extends StatefulWidget {
  const MovieDetailsHeader({super.key, required this.movies});

  final MovieDetailsParams movies;

  @override
  State<MovieDetailsHeader> createState() => _MovieDetailsHeaderState();
}

class _MovieDetailsHeaderState extends State<MovieDetailsHeader> {
  @override
  Widget build(BuildContext context) {
    final String id =
        '${widget.movies.genreTitle}${widget.movies.movieResults?.name}${widget.movies.movieResults?.id}';

    return Hero(
      tag: id,
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
            height: screenHeight * .4,
            child: Stack(
              children: [
                SizedBox(
                  height: screenHeight * .3,
                  child: ImageWidget(
                    imageTypes: ImageTypes.network,
                    fit: BoxFit.cover,
                    width: screenWidth,
                    imageUrl: widget.movies.movieResults?.backdropPath ?? '',
                    loader: const ShimmerWidget(),
                  ),
                ),
                Positioned(
                  bottom: kMinute,
                  left: kfsExtraLarge,
                  child: MovieCardTile(
                    imageUrl: widget.movies.movieResults?.posterPath ?? '',
                    onTap: () {},
                    height: h(120),
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
