import 'package:clean_architecture_movie/infra/datasources/movies_datasource.dart';
import 'package:clean_architecture_movie/infra/models/result_movie.dart';
import 'package:clean_architecture_movie/domain/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDatasource datasource;
  MoviesRepositoryImpl(this.datasource);

  @override
  Future<Either<AppExceptions, Movie>> upcomingList() async {
    try {
      final result = await datasource.getUpcomingList(1, 'PT-br');
      return Right(result);
    } catch (e) {
      return Left(AppExceptions());
    }
  }
}
