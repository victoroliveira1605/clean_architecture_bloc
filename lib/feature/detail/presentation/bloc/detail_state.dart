import 'package:clean_architecture_movie/feature/detail/domain/entities/detail.dart';
import 'package:equatable/equatable.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitialState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadSuccessState extends DetailState {
  final Detail detail;

  DetailLoadSuccessState({this.detail});

  @override
  List<Object> get props => [];
}

class DetailLoadFailedState extends DetailState {}
