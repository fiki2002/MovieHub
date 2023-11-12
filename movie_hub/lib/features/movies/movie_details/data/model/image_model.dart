import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class ImageModel extends ImageEntity {
  const ImageModel({
    required super.backdrops,
    required super.id,
    required super.logos,
    required super.posters,
  });

  factory ImageModel.fromJson(Mapped json) {
    return ImageModel(
      backdrops: json['backdrops'] != null
          ? (json['backdrops'] as List<dynamic>)
              .map((e) => BackdropModel.fromJson(e))
              .toList()
          : [],
      id: json['id'],
      logos: json['logo'] != null
          ? (json['logo'] as List<dynamic>)
              .map((e) => BackdropModel.fromJson(e))
              .toList()
          : [],
      posters: json['posters'] != null
          ? (json['posters'] as List<dynamic>)
              .map((e) => BackdropModel.fromJson(e))
              .toList()
          : [],
    );
  }
}

class BackdropModel extends BackdropEntity {
  const BackdropModel(
      {required super.aspectRatio,
      required super.filePath,
      required super.height,
      required super.iso6391,
      required super.voteAverage,
      required super.voteCount,
      required super.width});

  factory BackdropModel.fromJson(Mapped json) {
    return BackdropModel(
      aspectRatio: json['aspect_ratio'],
      filePath: json['file_path'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }
}
