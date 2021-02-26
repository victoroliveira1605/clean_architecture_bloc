import 'package:bloc/bloc.dart';
import 'package:clean_architecture_movie/feature/detail/domain/usecases/get_cast_crew.dart'
    as cast;
import 'package:clean_architecture_movie/feature/detail/presentation/bloc/detail_event.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/bloc/detail_state.dart';
import 'package:flutter/material.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final cast.GetCastCrew getCastCrew;

  DetailBloc({@required this.getCastCrew}) : super(DetailInitialState());

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is GetCastCrewEvent) {
      yield DetailLoadingState();
      final moviesFailedOrSuccess =
          await getCastCrew(cast.Params(id: event.id));
      yield moviesFailedOrSuccess.fold((l) => DetailLoadFailedState(),
          (r) => DetailLoadSuccessState(credits: r));
    }
  }
}
