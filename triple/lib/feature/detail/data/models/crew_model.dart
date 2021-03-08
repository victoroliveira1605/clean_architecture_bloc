import 'package:clean_architecture_triple/feature/detail/domain/entities/crew.dart';
import 'package:flutter/material.dart';

class CrewModel extends Crew {
  CrewModel({
    @required adult,
    @required gender,
    @required id,
    @required knownForDepartment,
    @required name,
    @required originalName,
    @required popularity,
    @required profilePath,
    @required creditId,
    @required department,
    @required job,
  }) : super(
          adult: adult,
          gender: gender,
          id: id,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          creditId: creditId,
          department: department,
          job: job,
        );

  factory CrewModel.fromJson(Map<String, dynamic> json) => CrewModel(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        creditId: json["credit_id"],
        department: json["department"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "credit_id": creditId,
        "department": department,
        "job": job,
      };
}
