import 'package:clean_architecture_bloc/feature/detail/domain/entities/credits.dart';
import 'package:equatable/equatable.dart';

abstract class CreditState extends Equatable {
  const CreditState();

  @override
  List<Object> get props => [];
}

class CreditInitialState extends CreditState {}

class CreditLoadingState extends CreditState {}

class CreditsLoadSuccessState extends CreditState {
  final Credits credits;

  CreditsLoadSuccessState({this.credits});

  @override
  List<Object> get props => [];
}

class CreditLoadFailedState extends CreditState {}
