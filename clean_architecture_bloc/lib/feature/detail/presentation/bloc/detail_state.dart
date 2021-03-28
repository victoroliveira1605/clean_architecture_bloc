import 'package:clean_architecture_bloc/feature/detail/domain/entities/detail.dart';
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

  DetailLoadSuccessState({required this.detail});

  @override
  List<Object> get props => [];
}

class DetailLoadFailedState extends DetailState {}
