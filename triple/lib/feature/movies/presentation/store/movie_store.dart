import 'package:clean_architecture_triple/core/error/failures.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_triple/feature/movies/domain/usecases/get_all_new_showing.dart';
import 'package:flutter_triple/flutter_triple.dart';

class MovieStore extends NotifierStore<Failure, Popular> {
  final GetAllNewShowing getAllNewShowing;
  MovieStore({required this.getAllNewShowing})
      : super(Popular(results: [], page: 0, totalResults: 0, totalPages: 0));

  getListNewShowing(int page) async {
    executeEither(() => getAllNewShowing(page));
  }
}
