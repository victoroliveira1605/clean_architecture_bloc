import 'package:clean_architecture_bloc/feature/detail/domain/entities/cast.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/crew.dart';
import 'package:equatable/equatable.dart';

class Credits extends Equatable {
  Credits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  final int id;
  final List<Cast> cast;
  final List<Crew> crew;

  @override
  List<Object> get props => [
        id,
        cast,
        crew,
      ];
}
