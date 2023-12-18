import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class ImageNotifier extends ChangeNotifier {
  final ImagesUsecase imageUsecase;

  ImageNotifier({
    required this.imageUsecase,
  });
 

  ImageModel? _images;
  ImageModel? get images => _images;
  Future<void> getImages(String movieId) async {
    _setImageState(ImageNotifierState.loading);
    final res = await imageUsecase.call(movieId);

    res.fold(
      (l) {
        _setImageState(ImageNotifierState.error);
      },
      (r) {
        _images = r;
        notifyListeners();
        _setImageState(ImageNotifierState.done);
      },
    );
  }

  ImageNotifierState _imageState = ImageNotifierState.done;
  ImageNotifierState get imageState => _imageState;

  void _setImageState(ImageNotifierState state) {
    _imageState = state;
    notifyListeners();
  }
}

enum ImageNotifierState { loading, done, error }
