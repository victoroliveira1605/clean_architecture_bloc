import 'package:clean_architecture_triple/feature/movies/domain/entities/original_language.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/result.dart';
import 'package:flutter/material.dart';

class ResultModel extends Result {
  ResultModel({
    @required popularity,
    @required voteCount,
    @required video,
    @required posterPath,
    @required id,
    @required adult,
    @required backdropPath,
    @required originalLanguage,
    @required originalTitle,
    @required genreIds,
    @required title,
    @required voteAverage,
    @required overview,
    @required releaseDate,
  }) : super(
            popularity: popularity,
            voteCount: voteCount,
            video: video,
            posterPath: posterPath,
            id: id,
            adult: adult,
            backdropPath: backdropPath,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            genreIds: genreIds,
            title: title,
            voteAverage: voteAverage,
            overview: overview,
            releaseDate: releaseDate);

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: json["release_date"],
      );

  Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "poster_path": posterPath,
        "id": id,
        "adult": adult,
        "backdrop_path": backdropPath,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "title": title,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": releaseDate
      };
}
