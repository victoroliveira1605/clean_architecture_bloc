import 'package:clean_architecture_bloc/core/error/failures.dart';
import 'package:clean_architecture_bloc/core/exceptions/exceptions.dart';
import 'package:clean_architecture_bloc/core/network/network_info.dart';
import 'package:clean_architecture_bloc/feature/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/upcoming.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDatasource;
  final NetworkInfo networkInfo;

  MoviesRepositoryImpl(
      {@required this.moviesRemoteDatasource, @required this.networkInfo});

  @override
  Future<Either<Failure, Popular>> getAllNewShowing(int page) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await moviesRemoteDatasource.getAllNewShowing(page));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Upcoming>> getAllSoon(int page) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await moviesRemoteDatasource.getAllSoon(page));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
