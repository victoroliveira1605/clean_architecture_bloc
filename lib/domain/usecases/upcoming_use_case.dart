import 'package:clean_architecture_movie/infra/models/result_movie.dart';
import 'package:clean_architecture_movie/domain/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

mixin UpcomingUseCase {
  Future<Either<AppExceptions, Movie>> call();
}

@Injectable(as: UpcomingUseCase)
class UpcomingList implements UpcomingUseCase {
  final MoviesRepository repository;

  UpcomingList(this.repository);

  @override
  Future<Either<AppExceptions, Movie>> call() async {
    return repository.upcomingList();
  }
}
