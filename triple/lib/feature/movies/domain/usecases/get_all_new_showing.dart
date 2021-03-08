import 'package:clean_architecture_triple/core/error/failures.dart';
import 'package:clean_architecture_triple/core/usecases/usecase.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_triple/feature/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllNewShowing implements UseCase<Popular, int> {
  final MoviesRepository moviesRepository;

  GetAllNewShowing(this.moviesRepository);

  @override
  Future<Either<Failure, Popular>> call(int page) async {
    return await moviesRepository.getAllNewShowing(page);
  }
}
