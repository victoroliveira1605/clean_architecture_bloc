import 'dart:convert';

import 'package:clean_architecture_bloc/core/constants/strings.dart';
import 'package:clean_architecture_bloc/core/exceptions/exceptions.dart';
import 'package:clean_architecture_bloc/feature/detail/data/models/credits_model.dart';
import 'package:clean_architecture_bloc/feature/detail/data/models/detail_model.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/credits.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class DetailRemoteDataSource {
  Future<Credits> getCastCrew(int id);
  Future<Detail> getDetail(int id);
}

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final http.Client client;

  DetailRemoteDataSourceImpl({@required this.client});

  @override
  Future<Credits> getCastCrew(int id) =>
      _getCastCrew(url + '3/movie/$id/credits', {'Authorization': key});

  Future<CreditsModel> _getCastCrew(
      String url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return CreditsModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Detail> getDetail(int id) =>
      _getDetail(url + '3/movie/$id', {'Authorization': key});

  Future<DetailModel> _getDetail(
      String url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return DetailModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }
}
