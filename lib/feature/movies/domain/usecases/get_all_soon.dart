import 'package:clean_architecture_movie/core/error/failures.dart';
import 'package:clean_architecture_movie/core/usecases/usecase.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/movies.dart';
import 'package:clean_architecture_movie/feature/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllSoon implements UseCase<Movies, NoParams> {
  final MoviesRepository moviesRepository;

  GetAllSoon(this.moviesRepository);

  @override
  Future<Either<Failure, Movies>> call(NoParams params) async {
    return await moviesRepository.getAllSoon();
  }
}
