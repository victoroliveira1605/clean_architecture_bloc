import 'package:clean_architecture_movie/core/error/failures.dart';
import 'package:clean_architecture_movie/core/usecases/usecase.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_movie/feature/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllNewShowing implements UseCase<Popular, NoParams> {
  final MoviesRepository moviesRepository;

  GetAllNewShowing(this.moviesRepository);

  @override
  Future<Either<Failure, Popular>> call(NoParams params) async {
    return await moviesRepository.getAllNewShowing();
  }
}
