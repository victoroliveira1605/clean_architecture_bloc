import 'dart:convert';

import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:clean_architecture_movie/core/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/feature/movies/data/models/movies_model.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class MoviesRemoteDataSource {
  Future<Movies> getAllMovies();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final http.Client client;

  MoviesRemoteDataSourceImpl({@required this.client});

  @override
  Future<Movies> getAllMovies() =>
      _getMoviesFromUrl(url + '3/movie/upcoming', {'Authorization': key});

  Future<MoviesModel> _getMoviesFromUrl(
      String url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return MoviesModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }
}
