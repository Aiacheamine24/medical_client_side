import 'package:medical_client_side/core/constants/app_config.dart';
import 'package:medical_client_side/core/network/networking.dart';
import 'package:medical_client_side/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  /// Login user
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginUserModel> login({
    required String identifier,
    required String password,
  });

  /// Register user
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginUserModel> register({
    required String identifier,
    required String password,
    required DateTime birthDate,
    required String? firstName,
    required String? lastName,
  });

  /// Logout user
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Networking networking;

  AuthRemoteDataSourceImpl({required this.networking});

  @override
  Future<LoginUserModel> login(
      {required String identifier, required String password}) async {
    try {
      final res =
          await networking.post(path: "${AppConfig.apiUrl}/auth/login", data: {
        "email": identifier,
        "password": password,
      });
      // Transform the response from Response<dynamic> to Map<String, dynamic>
      final Map<String, dynamic> data = res.data;
      return LoginUserModel.fromMap(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    try {
      throw UnimplementedError();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<LoginUserModel> register(
      {required String identifier,
      required String password,
      required DateTime birthDate,
      required String? firstName,
      required String? lastName}) {
    // TODO: implement register
    try {
      throw UnimplementedError();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
