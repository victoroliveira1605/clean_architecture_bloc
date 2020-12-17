import 'package:clean_architecture_movie/core/error/failures.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/movies.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepository {
  Future<Either<Failure, Movies>> getAllMovies();
}
