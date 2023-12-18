import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/discover/search_movies.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class ImagesUsecase implements UseCaseFuture<Failure, ImageModel, String> {
  final MovieDetailRepository movieDetailRepo;
  ImagesUsecase({
    required this.movieDetailRepo,
  });

  @override
  FutureOr<Either<Failure, ImageModel>> call(String params) async {
    return await movieDetailRepo.getImages(params);
  }
}
