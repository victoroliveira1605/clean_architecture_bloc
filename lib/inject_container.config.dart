// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data/http/app_http_manager.dart';
import 'data/http/http_manager.dart';
import 'infra/datasources/movies_datasource.dart';
import 'domain/repositories/movies_repository.dart';
import 'infra/repositories/movies_repository_impl.dart';
import 'data/datasources/remote/themovie_datasource.dart';
import 'presenter/upcoming/upcoming_bloc.dart';
import 'domain/usecases/upcoming_use_case.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<MoviesDatasource>(
      () => ThemovieDatasource(httpManager: get<HttpManager>()));
  gh.factory<MoviesRepository>(
      () => MoviesRepositoryImpl(get<MoviesDatasource>()));
  gh.factory<UpcomingUseCase>(() => UpcomingList(get<MoviesRepository>()));
  gh.factory<UpcomingBloc>(() => UpcomingBloc(get<UpcomingUseCase>()));

  // Eager singletons must be registered in the right order
  gh.singleton<HttpManager>(AppHttpManager());
  return get;
}
