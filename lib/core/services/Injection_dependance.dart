import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:nico_test/features/auth/data/repository/Auth_repository_impl.dart';
import 'package:nico_test/features/auth/data/sources/Auth_datasource.dart';
import 'package:nico_test/features/auth/domain/repository/Auth_repository.dart';
import 'package:nico_test/features/auth/presentation/bloc/User_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => User_bloc(repository: sl()));

  // Repository
  sl.registerLazySingleton<Auth_repository>(() => AuthRepositoryImpl(
    remoteDataSource: sl(),
  ));

  // Data sources
  sl.registerLazySingleton<Auth_datasource>(() => AuthRemoteDataSourceImpl(client: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}