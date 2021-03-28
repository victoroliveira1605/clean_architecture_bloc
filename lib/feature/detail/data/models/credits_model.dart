import 'package:clean_architecture_bloc/feature/detail/data/models/cast_model.dart';
import 'package:clean_architecture_bloc/feature/detail/data/models/crew_model.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/cast.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/credits.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/crew.dart';
import 'package:flutter/material.dart';

class CreditsModel extends Credits {
  CreditsModel({
    @required id,
    @required cast,
    @required crew,
  }) : super(
          id: id,
          cast: cast,
          crew: crew,
        );

  factory CreditsModel.fromJson(Map<String, dynamic> json) => CreditsModel(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => CastModel.fromJson(x))),
        crew: List<Crew>.from(json["crew"].map((x) => CrewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x)),
        "crew": List<dynamic>.from(crew.map((x) => x)),
      };
}
