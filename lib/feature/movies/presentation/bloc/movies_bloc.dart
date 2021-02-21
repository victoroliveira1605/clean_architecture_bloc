import 'package:bloc/bloc.dart';
import 'package:clean_architecture_movie/feature/movies/domain/usecases/get_all_new_showing.dart';
import 'package:clean_architecture_movie/feature/movies/domain/usecases/get_all_soon.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_event.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_state.dart';
import 'package:flutter/material.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetAllNewShowing getAllNewShowing;
  final GetAllSoon getAllSoon;
  int page = 1;
  bool isFetching = false;

  MoviesBloc({@required this.getAllNewShowing, @required this.getAllSoon})
      : super(MoviesInitialState());

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is GetAllNewShowingEvent) {
      yield MoviesLoadingState();
      final moviesFailedOrSuccess = await getAllNewShowing(page);
      yield moviesFailedOrSuccess.fold((l) => MoviesLoadFailedState(),
          (r) => MoviesLoadSuccessState(movies: r));
    } else if (event is GetAllSoonEvent) {
      yield MoviesLoadingState();
      final moviesFailedOrSuccess = await getAllSoon(page);
      yield moviesFailedOrSuccess.fold((l) => MoviesLoadFailedState(),
          (r) => MoviesLoadSuccessState(movies: r));
    }
  }
}
