import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Dates extends Equatable {
  Dates({
    @required this.maximum,
    @required this.minimum,
  });

  final DateTime maximum;
  final DateTime minimum;

  @override
  List<Object> get props => [maximum, minimum];
}
