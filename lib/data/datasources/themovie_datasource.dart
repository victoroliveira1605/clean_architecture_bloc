import 'dart:convert';

import 'package:clean_architecture_movie/infra/models/movies.dart';
import 'package:clean_architecture_movie/utils/strings/constants.dart';
import 'package:injectable/injectable.dart';

import 'package:clean_architecture_movie/data/http/http_manager.dart';
import 'package:clean_architecture_movie/infra/datasources/movies_datasource.dart';

@Injectable(as: MoviesDatasource)
class ThemovieDatasource implements MoviesDatasource {
  final HttpManager httpManager;
  ThemovieDatasource({
    this.httpManager,
  });

  @override
  Future<Movie> getUpcomingList(int page, String language) async {
    final response = await httpManager
        .get(url: '3/movie/upcoming', headers: {'Authorization': apiKey});
    return Movie.fromJson(json.decode(response));
  }
}
