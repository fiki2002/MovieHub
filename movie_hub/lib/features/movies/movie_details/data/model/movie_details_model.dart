import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/domain/entities/movie_details_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  const MovieDetailModel({
    required super.adult,
    required super.backdropPath,
    required super.belongsToCollection,
    required super.budget,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.imdbId,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required super.spokenLanguages,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieDetailModel.fromJson(Mapped json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: json['genres'] != null
          ? (json['genres'] as List<dynamic>)
              .map((e) => GenreModel.fromJson(e as Mapped))
              .toList()
          : [],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: json['production_companies'] != null
          ? (json['production_companies'] as List<dynamic>)
              .map((e) => ProductionCompanyModel.fromJson(e as Mapped))
              .toList()
          : [],
      productionCountries: json['production_countries'] != null
          ? (json['production_countries'] as List<dynamic>)
              .map((e) => ProductionCountryModel.fromJson(e as Mapped))
              .toList()
          : [],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: json['spoken_languages'] != null
          ? (json['spoken_languages'] as List<dynamic>)
              .map((e) => SpokenLanguageModel.fromJson(e as Mapped))
              .toList()
          : [],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

class GenreModel extends GenreEntity {
  const GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Mapped json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompanyModel extends ProductionCompanyEntity {
  const ProductionCompanyModel(
      {required super.id,
      required super.logoPath,
      required super.name,
      required super.originCountry});

  factory ProductionCompanyModel.fromJson(Mapped json) {
    return ProductionCompanyModel(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountryModel extends ProductionCountryEntity {
  const ProductionCountryModel({
    required super.iso31661,
    required super.name,
  });

  factory ProductionCountryModel.fromJson(Mapped json) {
    return ProductionCountryModel(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class SpokenLanguageModel extends SpokenLanguageEntity {
  const SpokenLanguageModel({
    required super.englishName,
    required super.iso6391,
    required super.name,
  });

  factory SpokenLanguageModel.fromJson(Mapped json) {
    return SpokenLanguageModel(
        englishName: json['english_name'],
        iso6391: json['iso_639_1'],
        name: json['name']);
  }
}
