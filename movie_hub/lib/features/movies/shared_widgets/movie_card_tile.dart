import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

class MovieCardTile extends StatefulWidget {
  const MovieCardTile({
    super.key,
    required this.imageUrl,
    required this.onTap,
    this.height,
    this.margin,
  });
  final String imageUrl;
  final VoidCallback onTap;
  final double? height;
  final EdgeInsets? margin;

  @override
  State<MovieCardTile> createState() => _MovieCardTileState();
}

class _MovieCardTileState extends State<MovieCardTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? kXtremeLarge,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kfsTiny),
          color: kcGrey.withOpacity(.3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kfsTiny),
          child: ImageWidget(
            imageTypes: ImageTypes.network,
            imageUrl: widget.imageUrl,
            fit: BoxFit.cover,
            loader: const ShimmerWidget(),
          ),
        ),
      ),
    );
  }
}
