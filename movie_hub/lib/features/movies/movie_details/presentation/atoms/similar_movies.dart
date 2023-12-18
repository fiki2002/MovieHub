import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';
import 'package:movie_hub/features/movies/shared_widgets/widgets.dart';
import 'package:provider/provider.dart';

class SimilarMovies extends StatefulWidget {
  const SimilarMovies({super.key, required this.movieId});
  final String movieId;

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.similarMovies.getSimilarMovies(widget.movieId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SimilarMoviesNotifier>(
      builder: (context, viewModel, _) {
        return Column(
          children: [
            switch (viewModel.similarMoviesState) {
              SimilarMoviesState.isLoading => const LoadingWidget(),
              SimilarMoviesState.isError => const SizedBox.shrink(),
              SimilarMoviesState.isDone => Visibility(
                  visible: viewModel.similarMovies?.results?.isNotEmpty ?? true,
                  child: GenreCardWidget(
                    padding: EdgeInsets.zero,
                    title: 'Similar Movies',
                    movies: viewModel.similarMovies?.results,
                    fontWeight: FontWeight.w700,
                  ),
                )
            }
          ],
        );
      },
    );
  }
}
