import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/usecases/get_cast_crew.dart'
    as cast;
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/credit_event.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/credit_state.dart';
import 'package:flutter/material.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  final cast.GetCastCrew getCastCrew;

  CreditBloc({@required this.getCastCrew}) : super(CreditInitialState());

  @override
  Stream<CreditState> mapEventToState(CreditEvent event) async* {
    if (event is GetCastCrewEvent) {
      yield CreditLoadingState();
      final moviesFailedOrSuccess =
          await getCastCrew(cast.Params(id: event.id));
      yield moviesFailedOrSuccess.fold((l) => CreditLoadFailedState(),
          (r) => CreditsLoadSuccessState(credits: r));
    }
  }
}
