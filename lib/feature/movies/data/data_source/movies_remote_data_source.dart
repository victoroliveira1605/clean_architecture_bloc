import 'dart:convert';

import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:clean_architecture_movie/core/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/feature/movies/data/models/popular_movies_model.dart';
import 'package:clean_architecture_movie/feature/movies/data/models/upcoming_movies_model.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/upcoming.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class MoviesRemoteDataSource {
  Future<Popular> getAllNewShowing();
  Future<Upcoming> getAllSoon();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final http.Client client;

  MoviesRemoteDataSourceImpl({@required this.client});

  @override
  Future<Popular> getAllNewShowing() =>
      _getNewShowingFromUrl(url + '3/movie/popular', {'Authorization': key});

  Future<PopularMoviesModel> _getNewShowingFromUrl(
      String url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return PopularMoviesModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Upcoming> getAllSoon() =>
      _getSoonFromUrl(url + '3/movie/upcoming', {'Authorization': key});

  Future<UpcomingMoviesModel> _getSoonFromUrl(
      String url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return UpcomingMoviesModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }
}
