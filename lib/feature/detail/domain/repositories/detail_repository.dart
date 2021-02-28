import 'package:clean_architecture_movie/core/error/failures.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/credits.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/detail.dart';
import 'package:dartz/dartz.dart';

abstract class DetailRepository {
  Future<Either<Failure, Credits>> getCastCrew(int id);
  Future<Either<Failure, Detail>> getDetail(int id);
}
