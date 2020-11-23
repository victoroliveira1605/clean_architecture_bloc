import 'package:clean_architecture_movie/domain/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/infra/models/movies.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepository {
  Future<Either<AppExceptions, Movie>> upcomingList();
}
