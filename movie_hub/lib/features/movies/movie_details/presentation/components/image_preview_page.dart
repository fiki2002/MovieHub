import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';

class ImagePreview extends StatelessWidget {
  static const String route = '/image-preview';

  const ImagePreview({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        backgroundColor: kcBackground,
        elevation: 0,
      ),
      useSingleScroll: false,
      usePadding: false,
      body: InteractiveViewer(
        child: Center(
          child: ImageWidget(
            imageTypes: ImageTypes.network,
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
