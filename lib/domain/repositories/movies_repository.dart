import 'package:clean_architecture_movie/infra/models/result_movie.dart';
import 'package:clean_architecture_movie/domain/errors/erros.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepository {
  Future<Either<MoviesFailure, List<Movie>>> listMovies();
}
