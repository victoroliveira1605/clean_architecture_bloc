import 'package:clean_architecture_movie/infra/datasources/movies_datasource.dart';
import 'package:clean_architecture_movie/infra/models/result_movie.dart';
import 'package:clean_architecture_movie/domain/errors/erros.dart';
import 'package:clean_architecture_movie/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDatasource datasource;
  MoviesRepositoryImpl(this.datasource);

  @override
  Future<Either<MoviesFailure, List<Movie>>> listMovies() async {
    try {
      final result = await datasource.getListUpcoming(1, 'PT-br');
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
