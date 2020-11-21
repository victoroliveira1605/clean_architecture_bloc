import 'package:clean_architecture_movie/domain/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/infra/models/result_movie.dart';

abstract class UpcomingState {}

class UpcomingSuccessState implements UpcomingState {
  final Movie movie;
  UpcomingSuccessState({
    this.movie,
  });
}

class UpcomingStartState implements UpcomingState {}

class UpcomingLoadingState implements UpcomingState {}

class UpcomingErrorState implements UpcomingState {
  final AppExceptions error;
  UpcomingErrorState({
    this.error,
  });
}
