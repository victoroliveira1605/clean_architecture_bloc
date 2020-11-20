import 'package:clean_architecture_movie/infra/models/result_movie.dart';
import 'package:clean_architecture_movie/domain/errors/erros.dart';
import 'package:clean_architecture_movie/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

abstract class Movies {
  Future<Either<MoviesFailure, List<Movie>>> call();
}

class MoviesImpl implements Movies {
  final MoviesRepository repository;

  MoviesImpl(this.repository);

  @override
  Future<Either<MoviesFailure, List<Movie>>> call() async {
    return repository.listMovies();
  }
}
