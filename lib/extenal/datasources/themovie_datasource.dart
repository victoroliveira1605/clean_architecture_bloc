import 'package:clean_architecture_movie/domain/errors/erros.dart';
import 'package:clean_architecture_movie/infra/datasources/movies_datasource.dart';
import 'package:clean_architecture_movie/infra/models/result_movie.dart';
import 'package:dio/dio.dart';

class ThemovieDatasource implements MoviesDatasource {
  final Dio dio;
  ThemovieDatasource(this.dio);

  @override
  Future<List<Movie>> getListUpcoming(int page, String language) async {
    dio.options.headers['Authorization'] =
        'Bearer ${'be3d1ca229a614071485a3d858e68a9a'}';

    final response =
        await dio.get('https://api.themoviedb.org/3/movie/upcoming');
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      throw DatasourceError();
    }
  }
}
