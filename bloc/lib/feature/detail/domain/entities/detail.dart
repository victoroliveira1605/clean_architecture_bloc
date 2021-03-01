import 'package:clean_architecture_bloc/feature/detail/domain/entities/genre.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/production_company.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/production_country.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/spoken_language.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Detail extends Equatable {
  Detail({
    @required this.id,
    @required this.adult,
    @required this.backdropPath,
    @required this.belongsToCollection,
    @required this.budget,
    @required this.genres,
    @required this.homepage,
    @required this.imdbId,
    @required this.originalLanguage,
    @required this.originalTitle,
    @required this.overview,
    @required this.popularity,
    @required this.posterPath,
    @required this.productionCompanies,
    @required this.productionCountries,
    @required this.releaseDate,
    @required this.revenue,
    @required this.runtime,
    @required this.spokenLanguages,
    @required this.status,
    @required this.tagline,
    @required this.title,
    @required this.video,
    @required this.voteAverage,
    @required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object> get props => [
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
