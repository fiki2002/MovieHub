import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class ImageNotifier extends BaseNotifier<ImageModel> {
  final ImagesUsecase imageUsecase;
  final String movieId;

  ImageNotifier({
    required this.imageUsecase,
    required this.movieId,
  });
  @override
  void onInit() {
    getImages(movieId);
  }

  Future<void> getImages(String movieId) async {
    setLoading();
    state = await imageUsecase.execute(movieId);
    notifyListeners();
  }
}
