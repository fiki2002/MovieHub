import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';
import 'package:movie_hub/features/movies/shared_widgets/widgets.dart';
import 'package:provider/provider.dart';

class ImagesSection extends StatefulWidget {
  const ImagesSection({super.key, required this.movies});
  final MovieDetailsParams movies;

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.images
            .getImages((widget.movies.movieResults?.id ?? '').toString());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageNotifier>(
      builder: (context, viewModel, _) {
        final ImageModel? images = viewModel.images;
        return Column(
          children: [
            switch (viewModel.imageState) {
              ImageNotifierState.done => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (images?.backdrops != [] || images?.backdrops != null)
                      const TextWidget(
                        'Images',
                        fontWeight: FontWeight.w700,
                      ),
                    vSpace(kfsTiny),
                    GridViewWidget(
                      list: images?.backdrops ?? [],
                    ),
                  ],
                ),
              ImageNotifierState.error => const SizedBox.shrink(),
              ImageNotifierState.loading => const LoadingWidget(),
            }
          ],
        );
      },
    );
  }
}
