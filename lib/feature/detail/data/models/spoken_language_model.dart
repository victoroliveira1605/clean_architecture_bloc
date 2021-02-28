import 'package:clean_architecture_movie/feature/detail/domain/entities/spoken_language.dart';
import 'package:flutter/material.dart';

class SpokenLanguageModel extends SpokenLanguage {
  SpokenLanguageModel({
    @required englishName,
    @required iso6391,
    @required name,
  }) : super(
          englishName: englishName,
          iso6391: iso6391,
          name: name,
        );

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageModel(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
