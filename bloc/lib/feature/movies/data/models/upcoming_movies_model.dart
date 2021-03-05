import 'package:clean_architecture_bloc/feature/movies/data/models/dates_model.dart';
import 'package:clean_architecture_bloc/feature/movies/data/models/result._model.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/upcoming.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesModel extends Upcoming {
  UpcomingMoviesModel({
    @required results,
    @required page,
    @required totalResults,
    @required dates,
    @required totalPages,
  }) : super(
            results: results,
            page: page,
            totalResults: totalResults,
            dates: dates,
            totalPages: totalPages);

  factory UpcomingMoviesModel.fromJson(Map<String, dynamic> json) =>
      UpcomingMoviesModel(
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
        page: json["page"],
        totalResults: json["total_results"],
        dates: DatesModel.fromJson(json["dates"]),
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() {
    List<Map> _results = this.results.map((i) => i.toJson()).toList();
    return {
      "results": _results,
      "page": page,
      "total_results": totalResults,
      "dates": dates.toJson(),
      "total_pages": totalPages,
    };
  }
}
