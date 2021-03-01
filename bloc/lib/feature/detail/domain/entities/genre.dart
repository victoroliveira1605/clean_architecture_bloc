import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Genre extends Equatable {
  Genre({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
