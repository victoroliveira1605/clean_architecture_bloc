import 'package:bloc/bloc.dart';
import 'package:clean_architecture_movie/core/usecases/usecase.dart';
import 'package:clean_architecture_movie/feature/movies/domain/usecases/get_all_movies.dart';

import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_event.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_state.dart';
import 'package:flutter/material.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc({@required this.getAllMovies}) : super(MoviesInitialState());
  final GetAllMovies getAllMovies;

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is GetMoviesEvent) {
      print('GetMoviesEvent : called');
      yield MoviesLoadingState();
      final moviesFailedOrSuccess = await getAllMovies(NoParams());
      yield moviesFailedOrSuccess.fold((l) => MoviesLoadFailedState(),
          (r) => MoviesLoadSuccessState(movies: r));
    }
  }
}
