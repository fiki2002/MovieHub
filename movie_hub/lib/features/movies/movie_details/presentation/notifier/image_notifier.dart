import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class ImageNotifier extends BaseNotifier<ImageModel> {
  final ImagesUsecase imageUsecase;

  ImageNotifier({
    required this.imageUsecase,
  });
  void init(String movieId) {
    getImages(movieId);
  }

  Future<void> getImages(String movieId) async {
    setLoading();
    state = await imageUsecase.execute(movieId);
    notifyListeners();
  }
}
