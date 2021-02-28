import 'package:clean_architecture_movie/feature/detail/data/models/genre_model.dart';
import 'package:clean_architecture_movie/feature/detail/data/models/production_company_model.dart';
import 'package:clean_architecture_movie/feature/detail/data/models/production_country_model.dart';
import 'package:clean_architecture_movie/feature/detail/data/models/spoken_language_model.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/detail.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/genre.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/production_company.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/production_country.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/spoken_language.dart';
import 'package:flutter/material.dart';

class DetailModel extends Detail {
  DetailModel({
    @required id,
    @required adult,
    @required backdropPath,
    @required belongsToCollection,
    @required budget,
    @required genres,
    @required homepage,
    @required imdbId,
    @required originalLanguage,
    @required originalTitle,
    @required overview,
    @required popularity,
    @required posterPath,
    @required productionCompanies,
    @required productionCountries,
    @required releaseDate,
    @required revenue,
    @required runtime,
    @required spokenLanguages,
    @required status,
    @required tagline,
    @required title,
    @required video,
    @required voteAverage,
    @required voteCount,
  }) : super(
          id: id,
          adult: adult,
          backdropPath: backdropPath,
          belongsToCollection: belongsToCollection,
          budget: budget,
          genres: genres,
          homepage: homepage,
          imdbId: imdbId,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          spokenLanguages: spokenLanguages,
          status: status,
          tagline: tagline,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres:
            List<Genre>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompanyModel.fromJson(x))),
        productionCountries: List<ProductionCountry>.from(
            json["production_countries"]
                .map((x) => ProductionCountryModel.fromJson(x))),
        releaseDate: json["release_date"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"]
            .map((x) => SpokenLanguageModel.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x)),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x)),
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x)),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
