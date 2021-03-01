import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductionCountry extends Equatable {
  ProductionCountry({
    @required this.iso31661,
    @required this.name,
  });

  final String iso31661;
  final String name;

  @override
  List<Object> get props => [
        iso31661,
        name,
      ];
}
