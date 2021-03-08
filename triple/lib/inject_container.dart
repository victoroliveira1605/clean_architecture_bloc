import 'package:clean_architecture_triple/feature/detail/data/data_source/detail_remote_data_source.dart';
import 'package:clean_architecture_triple/feature/detail/data/repositories/detail_repository_impl.dart';
import 'package:clean_architecture_triple/feature/detail/domain/repositories/detail_repository.dart';
import 'package:clean_architecture_triple/feature/detail/domain/usecases/get_cast_crew.dart';
import 'package:clean_architecture_triple/feature/detail/domain/usecases/get_detail.dart';
import 'package:clean_architecture_triple/feature/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_architecture_triple/feature/movies/data/repositories/movies_repository_impl.dart';
import 'package:clean_architecture_triple/feature/movies/domain/repositories/movies_repository.dart';
import 'package:clean_architecture_triple/feature/movies/domain/usecases/get_all_new_showing.dart';
import 'package:clean_architecture_triple/feature/movies/domain/usecases/get_all_soon.dart';
import 'package:clean_architecture_triple/feature/movies/presentation/store/movie_store.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  //Store
  getIt.registerFactory<MovieStore>(
    () => MovieStore(
      getAllNewShowing: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetAllNewShowing(getIt()),
  );

  getIt.registerLazySingleton(
    () => GetAllSoon(getIt()),
  );

  getIt.registerLazySingleton(
    () => GetCastCrew(getIt()),
  );

  getIt.registerLazySingleton(
    () => GetDetail(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      moviesRemoteDatasource: getIt(),
      // networkInfo: getIt(),
    ),
  );
  getIt.registerLazySingleton<DetailRepository>(
    () => DetailRepositoryImpl(
      detailRemoteDatasource: getIt(),
      // networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSourceImpl(client: getIt()),
  );

  //! Core
  // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! External
  getIt.registerLazySingleton(() => http.Client());
  // getIt.registerLazySingleton(() => Connectivity());
}
