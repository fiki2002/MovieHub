import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';


class TrendingMoviesModel extends TrendingMovieEntity {
  const TrendingMoviesModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory TrendingMoviesModel.fromJson(Mapped json) {
    return TrendingMoviesModel(
      page: json['page'],
      results: json['results'] != null
          ? (json['results'] as List<dynamic>)
              .map((e) =>
                  TrendingMoviesResultModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Mapped toJson() {
    return {
      'page': page,
      'results': results,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

class TrendingMoviesResultModel extends TrendingMovieResultsEntity {
  const TrendingMoviesResultModel({
    required super.adult,
    required super.backdropPath,
    required super.id,
    required super.name,
    required super.originalLanguage,
    required super.originalName,
    required super.overview,
    required super.posterPath,
    required super.mediaType,
    required super.genreIds,
    required super.popularity,
    required super.firstAirDate,
    required super.voteAverage,
    required super.voteCount,
    required super.originCountry,
  });

  factory TrendingMoviesResultModel.fromJson(Mapped json) {
    return TrendingMoviesResultModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      firstAirDate: json['first_air_date'],
      genreIds: json['genre_ids'] != null
          ? (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList()
          : [],
      mediaType: json['media_type'],
      name: json['name'],
      originCountry: json['origin_country'] != null
          ? (json['origin_country'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          : [],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Mapped toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'first_air_date': firstAirDate,
      'genre_ids': genreIds,
      'media_type': mediaType,
      'name': name,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      "overview": overview,
      "popularity": popularity,
      " poster_path": posterPath,
      "vote_average": voteAverage,
      "vote_count": voteCount,
    };
  }
}
