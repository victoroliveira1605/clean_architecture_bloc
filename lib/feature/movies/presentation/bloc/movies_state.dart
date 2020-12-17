import 'package:clean_architecture_movie/feature/movies/domain/entities/movies.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitialState extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesLoadSuccessState extends MoviesState {
  final Movies movies;

  MoviesLoadSuccessState({this.movies});

  @override
  List<Object> get props => [];
}

class MoviesLoadFailedState extends MoviesState {}
