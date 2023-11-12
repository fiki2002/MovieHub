import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class ImagesUsecase{
   final MovieDetailRepository movieDetailRepo;
  ImagesUsecase({
    required this.movieDetailRepo,
  });

  Future<NotifierState<ImageModel>> execute(String movieId) async {
    return await movieDetailRepo.getImages(movieId);
  }
}