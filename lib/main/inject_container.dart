import 'package:clean_architecture_movie/domain/repositories/movies_repository.dart';
import 'package:clean_architecture_movie/domain/usecases/movies.dart';
import 'package:clean_architecture_movie/extenal/datasources/themovie_datasource.dart';
import 'package:clean_architecture_movie/infra/datasources/movies_datasource.dart';
import 'package:clean_architecture_movie/infra/repositories/movies_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  inject.registerLazySingleton<Dio>(() => Dio());
  inject.registerLazySingleton<ThemovieDatasource>(
      () => ThemovieDatasource(inject<Dio>()));
  inject.registerLazySingleton<MoviesRepositoryImpl>(
      () => MoviesRepositoryImpl(inject<MoviesDatasource>()));
  inject.registerLazySingleton<MoviesImpl>(
      () => MoviesImpl(inject<MoviesRepository>()));
}
