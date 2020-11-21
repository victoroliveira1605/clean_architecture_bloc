import 'package:clean_architecture_movie/infra/models/result_movie.dart';

abstract class MoviesDatasource {
  Future<Movie> getUpcomingList(int page, String language);
}
