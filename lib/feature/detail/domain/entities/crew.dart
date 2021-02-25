import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Crew extends Equatable {
  Crew({
    @required this.adult,
    @required this.gender,
    @required this.id,
    @required this.knownForDepartment,
    @required this.name,
    @required this.originalName,
    @required this.popularity,
    @required this.profilePath,
    @required this.creditId,
    @required this.department,
    @required this.job,
  });

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final String creditId;
  final String department;
  final String job;

  @override
  List<Object> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        creditId,
        department,
        job,
      ];
}
