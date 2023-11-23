import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final num? page;
  final List<MovieResultsEntity>? results;
  final num? totalPages;
  final num? totalResults;
  const MovieEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class MovieResultsEntity extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final num? id;
  final String? name;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final List<num>? genreIds;
  final num? popularity;
  final String? firstAirDate;
  final String? releaseDate;
  final num? voteAverage;
  final num? voteCount;
  final List<String>? originCountry;
  const MovieResultsEntity({
    this.adult,
    this.releaseDate,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        name,
        originalLanguage,
        originalLanguage,
        originCountry,
        overview,
        posterPath,
        mediaType,
        genreIds,
        popularity,
        firstAirDate,
        voteAverage,
        voteCount,
        originCountry,
      ];
}
