import 'package:clean_architecture_movie/domain/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/infra/models/movies.dart';

abstract class MoviesState {}

class MoviesStartState implements MoviesState {
  const MoviesStartState();
}

class MoviesLoadingState implements MoviesState {
  const MoviesLoadingState();
}

class MoviesSuccessState implements MoviesState {
  final Movie movie;
  const MoviesSuccessState({
    this.movie,
  });
}

class MoviesErrorState implements MoviesState {
  final AppExceptions error;
  const MoviesErrorState({
    this.error,
  });
}
