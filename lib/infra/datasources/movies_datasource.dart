import 'package:clean_architecture_movie/infra/models/movies.dart';

abstract class MoviesDatasource {
  Future<Movie> getUpcomingList(int page, String language);
}
