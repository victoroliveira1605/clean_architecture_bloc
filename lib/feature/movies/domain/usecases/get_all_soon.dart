import 'package:clean_architecture_movie/core/error/failures.dart';
import 'package:clean_architecture_movie/core/usecases/usecase.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/upcoming.dart';
import 'package:clean_architecture_movie/feature/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllSoon implements UseCase<Upcoming, NoParams> {
  final MoviesRepository moviesRepository;

  GetAllSoon(this.moviesRepository);

  @override
  Future<Either<Failure, Upcoming>> call(NoParams params) async {
    return await moviesRepository.getAllSoon();
  }
}
