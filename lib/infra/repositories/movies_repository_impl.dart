import 'package:clean_architecture_movie/infra/datasources/movies_datasource.dart';
import 'package:clean_architecture_movie/domain/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/domain/repositories/movies_repository.dart';
import 'package:clean_architecture_movie/infra/models/movies.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDatasource datasource;
  MoviesRepositoryImpl(this.datasource);

  @override
  Future<Either<AppExceptions, Movie>> upcomingList() async {
    Movie movies;

    try {
      movies = await datasource.getUpcomingList(1, 'pt-BR');
      right(movies);
    } catch (e) {
      return left(AppExceptions(e));
    }

    return movies == null
        ? left(AppExceptions('Movies is null'))
        : right(movies);
  }
}
