import 'package:clean_architecture_movie/core/error/failures.dart';
import 'package:clean_architecture_movie/core/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/core/network/network_info.dart';
import 'package:clean_architecture_movie/feature/detail/data/data_source/detail_remote_data_source.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/credits.dart';
import 'package:clean_architecture_movie/feature/detail/domain/repositories/detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource detailRemoteDatasource;
  final NetworkInfo networkInfo;

  DetailRepositoryImpl(
      {@required this.detailRemoteDatasource, @required this.networkInfo});

  @override
  Future<Either<Failure, Credits>> getCastCrew(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await detailRemoteDatasource.getCastCrew(id));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
