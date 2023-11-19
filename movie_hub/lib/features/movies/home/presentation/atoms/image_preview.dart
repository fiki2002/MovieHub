import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:shimmer/shimmer.dart';

class HomeImagePreview extends StatefulWidget {
  const HomeImagePreview({
    super.key,
    required this.url,
    required this.title,
  });
  final String url;
  final String title;

  @override
  State<HomeImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<HomeImagePreview> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadImages();
  }

  Future<void> loadImages() async {
    try {
      await precacheImage(
          CachedNetworkImageProvider('$baseNetworkImage${widget.url}'),
          context);
      'image cached successfully!!'.log();
    } catch (e) {
      'Failed to cache image!!'.log();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: screenHeight * .5,
          child: ImageWidget(
            imageTypes: ImageTypes.network,
            imageUrl: widget.url,
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
                  widget.title,
                  textAlign: TextAlign.center,
                  textColor: kcWhiteColor,
                  fontSize: kfs30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  fontFamily: playFair,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: kcBackground.withOpacity(.1),
      child: Container(
        height: screenHeight * .5,
      ),
    );
  }
}
