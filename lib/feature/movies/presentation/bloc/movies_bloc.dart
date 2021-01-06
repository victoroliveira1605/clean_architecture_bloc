import 'package:bloc/bloc.dart';
import 'package:clean_architecture_movie/core/usecases/usecase.dart';
import 'package:clean_architecture_movie/feature/movies/domain/usecases/get_all_new_showing.dart';
import 'package:clean_architecture_movie/feature/movies/domain/usecases/get_all_soon.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_event.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_state.dart';
import 'package:flutter/material.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc({@required this.getAllNewShowing, @required this.getAllSoon})
      : super(MoviesInitialState());
  final GetAllNewShowing getAllNewShowing;
  final GetAllSoon getAllSoon;

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    print(event);
    if (event is GetAllNewShowingEvent) {
      print('GetNewShowingEvent : called');
      yield MoviesLoadingState();
      final moviesFailedOrSuccess = await getAllNewShowing(NoParams());
      yield moviesFailedOrSuccess.fold((l) => MoviesLoadFailedState(),
          (r) => MoviesLoadSuccessState(movies: r));
    } else if (event is GetAllSoonEvent) {
      print("GetSoonEvent : called");
      yield MoviesLoadingState();
      final moviesFailedOrSuccess = await getAllSoon(NoParams());
      yield moviesFailedOrSuccess.fold((l) => MoviesLoadFailedState(),
          (r) => MoviesLoadSuccessState(movies: r));
    }
  }
}
