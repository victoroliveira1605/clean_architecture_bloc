import 'dart:convert';

import 'package:clean_architecture_triple/core/constants/strings.dart';
import 'package:clean_architecture_triple/core/exceptions/exceptions.dart';
import 'package:clean_architecture_triple/feature/movies/data/models/popular_movies_model.dart';
import 'package:clean_architecture_triple/feature/movies/data/models/upcoming_movies_model.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/upcoming.dart';
import 'package:http/http.dart' as http;

abstract class MoviesRemoteDataSource {
  Future<Popular> getAllNewShowing(int page);
  Future<Upcoming> getAllSoon(int page);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final http.Client client;

  MoviesRemoteDataSourceImpl({required this.client});

  @override
  Future<Popular> getAllNewShowing(int page) => _getNewShowingFromUrl(
      Uri.https(url, '/3/movie/popular', {'page': '$page'}),
      {'Authorization': key});

  Future<PopularMoviesModel> _getNewShowingFromUrl(
      Uri url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return PopularMoviesModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Upcoming> getAllSoon(int page) => _getSoonFromUrl(
      Uri.https(url, '/3/movie/upcoming', {'page': '$page'}),
      {'Authorization': key});

  Future<UpcomingMoviesModel> _getSoonFromUrl(
      Uri url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return UpcomingMoviesModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }
}
