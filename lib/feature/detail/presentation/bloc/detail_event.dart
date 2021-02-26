import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetCastCrewEvent extends DetailEvent {
  final int id;
  GetCastCrewEvent({this.id});

  @override
  List<Object> get props => [id];
}
