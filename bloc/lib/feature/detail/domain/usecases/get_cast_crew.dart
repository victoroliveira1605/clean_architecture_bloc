import 'package:clean_architecture_bloc/core/error/failures.dart';
import 'package:clean_architecture_bloc/core/usecases/usecase.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/credits.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/repositories/detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GetCastCrew implements UseCase<Credits, Params> {
  final DetailRepository detailRepository;

  GetCastCrew(this.detailRepository);

  @override
  Future<Either<Failure, Credits>> call(Params params) async {
    return await detailRepository.getCastCrew(params.id);
  }
}

class Params extends Equatable {
  final int id;

  Params({
    @required this.id,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
