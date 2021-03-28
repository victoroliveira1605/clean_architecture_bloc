import 'package:equatable/equatable.dart';

abstract class CreditEvent extends Equatable {
  const CreditEvent();

  @override
  List<Object> get props => [];
}

class GetCastCrewEvent extends CreditEvent {
  final int id;
  GetCastCrewEvent({required this.id});

  @override
  List<Object> get props => [id];
}
