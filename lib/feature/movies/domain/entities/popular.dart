import 'package:clean_architecture_movie/feature/movies/data/models/result._model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Popular extends Equatable {
  Popular({
    @required this.results,
    @required this.page,
    @required this.totalResults,
    @required this.totalPages,
  });

  final List<ResultModel> results;
  final int page;
  final int totalResults;
  final int totalPages;

  @override
  List<Object> get props => [results, page, totalResults, totalPages];
}
