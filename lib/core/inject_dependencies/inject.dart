import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:medical_client_side/core/network/networking.dart';
import 'package:medical_client_side/core/services/local_service.dart';
import 'package:medical_client_side/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:medical_client_side/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:medical_client_side/features/auth/domaine/repositories/auth_repository.dart';
import 'package:medical_client_side/features/auth/domaine/usecases/sign_in.dart';
import 'package:medical_client_side/features/auth/domaine/usecases/sign_up.dart';
import 'package:medical_client_side/features/auth/presentation/bloc/auth_bloc.dart';

final getItInstance = GetIt.instance;

Future<void> initDependencies() async {
  // Register the connection checker
  getItInstance
    ..registerLazySingleton(() => Dio())
    ..registerLazySingleton(() => NetworkingImpl())
    ..registerLazySingleton(() => InternetConnection())
    ..registerLazySingleton(() => LocalService());

  // Register the remote data source
  getItInstance
    ..registerFactory<AuthRepository>(() => AuthRepositoryImpl())
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(networking: getItInstance()))
    ..registerFactory<SignIn>(() => SignIn())
    ..registerFactory<SignUp>(() => SignUp())
    ..registerFactory<AuthBloc>(() => AuthBloc());
}
