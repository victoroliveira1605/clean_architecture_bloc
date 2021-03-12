import 'package:clean_architecture_triple/core/error/failures.dart';
import 'package:clean_architecture_triple/core/exceptions/exceptions.dart';
import 'package:clean_architecture_triple/feature/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/upcoming.dart';
import 'package:clean_architecture_triple/feature/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDatasource;

  MoviesRepositoryImpl({
    required this.moviesRemoteDatasource,
  });

  @override
  Future<Either<Failure, Popular>> getAllNewShowing(int page) async {
    try {
      return Right(await moviesRemoteDatasource.getAllNewShowing(page));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Upcoming>> getAllSoon(int page) async {
    try {
      return Right(await moviesRemoteDatasource.getAllSoon(page));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
