import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<GenreEntity>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity>? productionCompanies;
  final List<ProductionCountryEntity>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguageEntity>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  
  const MovieDetailEntity({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        belongsToCollection,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}

class GenreEntity extends Equatable {
  final int? id;
  final String? name;

  const GenreEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];
}

class ProductionCompanyEntity extends Equatable {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;
  const ProductionCompanyEntity({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  @override
  List<Object?> get props => [id, name, originCountry, logoPath];
}

class ProductionCountryEntity extends Equatable {
  final String? iso31661;
  final String? name;
  const ProductionCountryEntity({
    this.iso31661,
    this.name,
  });

  @override
  List<Object?> get props => [iso31661, name];
}

class SpokenLanguageEntity extends Equatable {
  final String? englishName;
  final String? iso6391;
  final String? name;
  const SpokenLanguageEntity({
    this.englishName,
    this.iso6391,
    this.name,
  });

  @override
  List<Object?> get props => [englishName, iso6391, name];
}
