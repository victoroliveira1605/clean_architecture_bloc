import 'package:bloc/bloc.dart';

import 'package:clean_architecture_movie/domain/usecases/upcoming_use_case.dart';
import 'package:clean_architecture_movie/presenter/movies/movies_event.dart';
import 'package:clean_architecture_movie/presenter/movies/movies_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final UpcomingUseCase moviesUseCase;

  MoviesBloc(this.moviesUseCase) : super(MoviesStartState());

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    switch (event.runtimeType) {
      case FetchMovieListEvent:
        yield* _fetchMovieList(event);
        break;
      default:
        break;
    }
  }

  Stream<MoviesState> _fetchMovieList(FetchMovieListEvent event) async* {
    yield MoviesLoadingState();

    final result = await moviesUseCase.getUpcomingList();

    yield result.fold(
        (l) => MoviesErrorState(error: l), (r) => MoviesSuccessState(movie: r));
  }
}
