import 'package:clean_architecture_bloc/feature/movies/data/models/result._model.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/popular.dart';
import 'package:flutter/material.dart';

class PopularMoviesModel extends Popular {
  PopularMoviesModel({
    @required results,
    @required page,
    @required totalResults,
    @required totalPages,
  }) : super(
            results: results,
            page: page,
            totalResults: totalResults,
            totalPages: totalPages);

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) =>
      PopularMoviesModel(
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() {
    List<Map> _results = this.results.map((i) => i.toJson()).toList();
    return {
      "results": _results,
      "page": page,
      "total_results": totalResults,
      "total_pages": totalPages,
    };
  }
}
