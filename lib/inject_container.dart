import 'package:clean_architecture_movie/core/network/network_info.dart';
import 'package:clean_architecture_movie/feature/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_architecture_movie/feature/movies/data/repositories/movies_repository_impl.dart';
import 'package:clean_architecture_movie/feature/movies/domain/repositories/movies_repository.dart';
import 'package:clean_architecture_movie/feature/movies/domain/usecases/get_all_new_showing.dart';
import 'package:clean_architecture_movie/feature/movies/domain/usecases/get_all_soon.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  //! Features - Products
  // Bloc
  getIt.registerFactory<MoviesBloc>(
    () => MoviesBloc(
      getAllNewShowing: getIt(),
      getAllSoon: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetAllNewShowing(getIt()),
  );

  getIt.registerLazySingleton(
    () => GetAllSoon(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      moviesRemoteDatasource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(client: getIt()),
  );

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! External
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => DataConnectionChecker());
}
