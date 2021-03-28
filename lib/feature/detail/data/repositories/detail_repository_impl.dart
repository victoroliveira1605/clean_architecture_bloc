import 'package:clean_architecture_bloc/core/error/failures.dart';
import 'package:clean_architecture_bloc/core/exceptions/exceptions.dart';
import 'package:clean_architecture_bloc/feature/detail/data/data_source/detail_remote_data_source.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/credits.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/detail.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/repositories/detail_repository.dart';
import 'package:dartz/dartz.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource detailRemoteDatasource;

  DetailRepositoryImpl({
    required this.detailRemoteDatasource,
  });

  @override
  Future<Either<Failure, Credits>> getCastCrew(int id) async {
    // if (await networkInfo.isConnected) {
    //   try {
    //     return Right(await detailRemoteDatasource.getCastCrew(id));
    //   } on ServerException {
    //     return Left(ServerFailure());
    //   }
    // } else {
    //   return Left(ServerFailure());
    // }
    try {
      return Right(await detailRemoteDatasource.getCastCrew(id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Detail>> getDetail(int id) async {
    // if (await networkInfo.isConnected) {
    //   try {
    //     return Right(await detailRemoteDatasource.getDetail(id));
    //   } on ServerException {
    //     return Left(ServerFailure());
    //   }
    // } else {
    //   return Left(ServerFailure());
    // }
    try {
      return Right(await detailRemoteDatasource.getDetail(id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
