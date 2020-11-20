import 'package:clean_architecture_movie/infra/models/result_movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getListUpcoming(int page, String language);
}
