import 'package:clean_architecture_movie/domain/exceptions/exceptions.dart';
import 'package:clean_architecture_movie/infra/models/movies.dart';

abstract class UpcomingState {}

class UpcomingStartState implements UpcomingState {
  const UpcomingStartState();
}

class UpcomingLoadingState implements UpcomingState {
  const UpcomingLoadingState();
}

class UpcomingSuccessState implements UpcomingState {
  final Movie movie;
  const UpcomingSuccessState({
    this.movie,
  });
}

class UpcomingErrorState implements UpcomingState {
  final AppExceptions error;
  const UpcomingErrorState({
    this.error,
  });
}
