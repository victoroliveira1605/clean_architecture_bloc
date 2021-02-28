import 'package:clean_architecture_movie/feature/detail/domain/entities/production_company.dart';
import 'package:flutter/material.dart';

class ProductionCompanyModel extends ProductionCompany {
  ProductionCompanyModel({
    @required id,
    @required logoPath,
    @required name,
    @required originCountry,
  }) : super(
            id: id,
            logoPath: logoPath,
            name: name,
            originCountry: originCountry);

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyModel(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}
