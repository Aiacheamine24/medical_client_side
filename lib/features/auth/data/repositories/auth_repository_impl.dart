import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medical_client_side/core/errors/failure.dart';
import 'package:medical_client_side/core/inject_dependencies/inject.dart';
import 'package:medical_client_side/core/network/networking.dart';
import 'package:medical_client_side/core/services/local_service.dart';
import 'package:medical_client_side/core/utils/typedef.dart';
import 'package:medical_client_side/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:medical_client_side/features/auth/domaine/entites/login_user.dart';
import 'package:medical_client_side/features/auth/domaine/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSourceImpl authRemoteDataSource =
      AuthRemoteDataSourceImpl(networking: NetworkingImpl());

  @override
  ResultFutureWithCustomClassResult<LoginUserEntity> signIn(
      {required String identifier, required String password}) async {
    try {
      final res = await authRemoteDataSource.login(
          identifier: identifier, password: password);
      getItInstance<LocalService>()
          .saveData(key: 'accessToken', data: res.accessToken);
      getItInstance<LocalService>()
          .saveData(key: 'refreshToken', data: res.refreshToken);

      LoginUserEntity loginUserEntity = LoginUserEntity(
        success: res.success,
        message: res.message,
        id: res.id,
        missingFields: res.missingFields,
      );

      return Right(loginUserEntity);
    } catch (e) {
      if (e is DioException) {
        return Left(ApiFailure(
            message: e.response?.data['msg'] ?? e.message,
            statusCode: e.response?.statusCode as int));
      } else {
        return Left(ApiFailure(message: e.toString(), statusCode: 500));
      }
    }
  }

  @override
  Future<Either<Failure, LoginUserEntity>> signUp({
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    required String email,
    required String password,
  }) async {
    try {
      final res = await authRemoteDataSource.register(
        identifier: email,
        password: password,
        birthDate: birthDate,
        firstName: firstName,
        lastName: lastName,
      );

      LoginUserEntity loginUserEntity = LoginUserEntity(
        success: res.success,
        message: res.message,
        id: res.id,
        missingFields: res.missingFields,
      );

      return Right(loginUserEntity);
    } catch (e) {
      if (e is DioException) {
        return Left(ApiFailure(
            message: e.response?.data['msg'] ?? e.message,
            statusCode: e.response?.statusCode as int));
      } else {
        return Left(ApiFailure(message: e.toString(), statusCode: 500));
      }
    }
  }
}
