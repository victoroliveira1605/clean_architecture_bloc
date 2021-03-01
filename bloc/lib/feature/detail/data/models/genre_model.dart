import 'package:clean_architecture_bloc/feature/detail/domain/entities/genre.dart';
import 'package:flutter/material.dart';

class GenreModel extends Genre {
  GenreModel({
    @required id,
    @required name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
