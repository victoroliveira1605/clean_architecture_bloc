import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitialState extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesLoadSuccessState extends MoviesState {
  final dynamic movies;

  MoviesLoadSuccessState({this.movies});

  @override
  List<Object> get props => [];
}

class MoviesLoadFailedState extends MoviesState {}
