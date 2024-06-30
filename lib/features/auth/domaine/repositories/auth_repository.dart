import 'package:medical_client_side/core/utils/typedef.dart';
import 'package:medical_client_side/features/auth/domaine/entites/login_user.dart';

abstract interface class AuthRepository {
  const AuthRepository();

  ResultFutureWithCustomClassResult<LoginUserEntity> signUp({
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    required String email,
    required String password,
    required String confirmPassword,
  });

  ResultFutureWithCustomClassResult<LoginUserEntity> signIn({
    required String identifier,
    required String password,
  });
}
