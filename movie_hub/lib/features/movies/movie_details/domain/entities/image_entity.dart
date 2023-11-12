import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final List<BackdropEntity>? backdrops;
  final int? id;
  final List<BackdropEntity>? logos;
  final List<BackdropEntity>? posters;
  const ImageEntity({
    this.backdrops,
    this.id,
    this.logos,
    this.posters,
  });
  @override
  List<Object?> get props => [
        backdrops,
        id,
        logos,
        posters,
      ];
}

class BackdropEntity extends Equatable {
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;
  const BackdropEntity({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  @override
  List<Object?> get props => [
        aspectRatio,
        height,
        iso6391,
        filePath,
        voteAverage,
        voteCount,
        width,
      ];
}
