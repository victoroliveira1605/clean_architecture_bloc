import 'package:clean_architecture_triple/core/error/failures.dart';
import 'package:clean_architecture_triple/feature/movies/data/models/result._model.dart';
import 'package:clean_architecture_triple/feature/movies/domain/usecases/get_all_new_showing.dart';
import 'package:flutter_triple/flutter_triple.dart';

class MovieStore extends NotifierStore<Failure, List<ResultModel>> {
  final GetAllNewShowing getAllNewShowing;
  MovieStore({required this.getAllNewShowing}) : super([]) {
    getListNewShowing(1);
  }

  Future getListNewShowing(int page) async {
    setLoading(true);
    final result = await getAllNewShowing(page);
    result.fold((l) => setError(l), (r) => update(r.results));
    setLoading(false);
  }
}
