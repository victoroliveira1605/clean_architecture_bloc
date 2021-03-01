import 'package:clean_architecture_bloc/core/error/failures.dart';
import 'package:clean_architecture_bloc/core/usecases/usecase.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/upcoming.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllSoon implements UseCase<Upcoming, int> {
  final MoviesRepository moviesRepository;

  GetAllSoon(this.moviesRepository);

  @override
  Future<Either<Failure, Upcoming>> call(int page) async {
    return await moviesRepository.getAllSoon(page);
  }
}
