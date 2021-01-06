import 'dart:convert';

import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:clean_architecture_movie/core/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/feature/movies/data/models/movies_model.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class MoviesRemoteDataSource {
  Future<Movies> getAllNewShowing();
  Future<Movies> getAllSoon();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final http.Client client;

  MoviesRemoteDataSourceImpl({@required this.client});

  @override
  Future<Movies> getAllNewShowing() =>
      _getNewShowingFromUrl(url + '3/movie/upcoming', {'Authorization': key});

  Future<MoviesModel> _getNewShowingFromUrl(
      String url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return MoviesModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Movies> getAllSoon() =>
      _getSoonFromUrl(url + '3/movie/upcoming', {'Authorization': key});

  Future<MoviesModel> _getSoonFromUrl(
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
