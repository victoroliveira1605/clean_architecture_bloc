import 'package:clean_architecture_triple/feature/movies/data/models/dates_model.dart';
import 'package:clean_architecture_triple/feature/movies/data/models/result._model.dart';
import 'package:equatable/equatable.dart';

class Upcoming extends Equatable {
  Upcoming({
    required this.results,
    required this.page,
    required this.totalResults,
    required this.dates,
    required this.totalPages,
  });

  final List<ResultModel> results;
  final int page;
  final int totalResults;
  final DatesModel dates;
  final int totalPages;

  @override
  List<Object> get props => [results, page, totalResults, dates, totalPages];
}
