import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key, required this.movies});
  final MovieDetailsParams movies;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final s = getIt<ImagesUsecase>();
        return ImageNotifier(
          imageUsecase: s,
          movieId: movies.movieResults?.id.toString() ?? '',
        );
      },
      child: Consumer<ImageNotifier>(
        builder: (context, imageNotifier, _) {
          return imageNotifier.state.when(
            done: (images) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (images.backdrops != [] || images.backdrops != null)
                    const TextWidget(
                      'Images',
                      fontWeight: FontWeight.w700,
                    ),
                  vSpace(kfsTiny),
                  GridViewWidget(
                    list: images.backdrops ?? [],
                  ),
                ],
              );
            },
            error: (e) => Text(e ?? ''),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        },
      ),
    );
  }
}
