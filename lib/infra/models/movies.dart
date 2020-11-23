import 'package:clean_architecture_movie/infra/models/dates.dart';
import 'package:clean_architecture_movie/infra/models/result.dart';

class Movie {
  Movie({
    this.results,
    this.page,
    this.totalResults,
    this.dates,
    this.totalPages,
  });

  List<Result> results;
  int page;
  int totalResults;
  Dates dates;
  int totalPages;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        page: json["page"],
        totalResults: json["total_results"],
        dates: Dates.fromJson(json["dates"]),
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "page": page,
        "total_results": totalResults,
        "dates": dates.toJson(),
        "total_pages": totalPages,
      };
}
