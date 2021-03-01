import 'package:clean_architecture_bloc/core/error/failures.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/upcoming.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepository {
  Future<Either<Failure, Popular>> getAllNewShowing(int page);
  Future<Either<Failure, Upcoming>> getAllSoon(int page);
}
