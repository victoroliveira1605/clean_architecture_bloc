import 'package:bloc/bloc.dart';

import 'package:clean_architecture_movie/domain/usecases/upcoming_use_case.dart';
import 'package:clean_architecture_movie/presenter/upcoming/upcoming_event.dart';
import 'package:clean_architecture_movie/presenter/upcoming/upcoming_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final UpcomingUseCase upcomingUseCase;

  UpcomingBloc(this.upcomingUseCase) : super(UpcomingStartState());

  @override
  Stream<UpcomingState> mapEventToState(UpcomingEvent event) async* {
    switch (event.runtimeType) {
      case FetchMovieListEvent:
        yield* _fetchMovieList(event);
        break;
      default:
        break;
    }
  }

  Stream<UpcomingState> _fetchMovieList(FetchMovieListEvent event) async* {
    yield UpcomingLoadingState();

    final result = await upcomingUseCase.getUpcomingList();

    yield result.fold((l) => UpcomingErrorState(error: l),
        (r) => UpcomingSuccessState(movie: r));
  }
}
