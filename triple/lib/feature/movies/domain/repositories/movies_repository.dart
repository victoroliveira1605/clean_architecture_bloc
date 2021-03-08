import 'package:clean_architecture_triple/core/error/failures.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/upcoming.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepository {
  Future<Either<Failure, Popular>> getAllNewShowing(int page);
  Future<Either<Failure, Upcoming>> getAllSoon(int page);
}
