import 'package:clean_architecture_bloc/feature/detail/domain/entities/production_country.dart';
import 'package:flutter/material.dart';

class ProductionCountryModel extends ProductionCountry {
  ProductionCountryModel({
    @required iso31661,
    @required name,
  }) : super(
          iso31661: iso31661,
          name: name,
        );

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      ProductionCountryModel(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}
