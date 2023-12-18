import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';
import 'package:movie_hub/features/movies/shared_widgets/widgets.dart';
import 'package:provider/provider.dart';

class MovieInfo extends StatefulWidget {
  const MovieInfo({
    super.key,
    required this.movieId,
    required this.movies,
  });
  final String movieId;
  final MovieDetailsParams movies;

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.movieDetails.getMovieDetails(widget.movieId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieDetailsNotifier>(
      builder: (context, viewModel, _) {
        return Column(
          children: [
            switch (viewModel.movieDetailState) {
              MovieDetailState.isLoading => const LoadingWidget(),
              MovieDetailState.isError => PageErrorWidget(
                  onTap: () {
                    context.movieDetails.getMovieDetails(widget.movieId);
                  },
                ),
              MovieDetailState.isDone => MovieInfoAtom(
                  movies: widget.movies,
                  movieDetails: viewModel.movieDetail,
                  movieId: widget.movieId,
                ),
            }
          ],
        );
      },
    );
  }
}
