// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
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
    loadImages();
  }

  Future<void> loadImages() async {
    try {
      final String backDrop = widget.movies.movieResults?.backdropPath ?? '';
      final String posterPath = widget.movies.movieResults?.posterPath ?? '';
      await precacheImage(
        CachedNetworkImageProvider('$baseNetworkImage$backDrop'),
        context,
      );
      await precacheImage(
        CachedNetworkImageProvider('$baseNetworkImage$posterPath'),
        context,
      );
      'image cached successfully!!'.log();
    } catch (e) {
      e.log();
      'Failed to cache image!!'.log();
    }
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
                imageUrl: widget.movies.movieResults?.backdropPath ?? '',
                loader: const ShimmerWidget(),
              ),
            ),
            Positioned(
              bottom: 25,
              left: 20,
              child: MovieCardTile(
                imageUrl: widget.movies.movieResults?.posterPath ?? '',
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
