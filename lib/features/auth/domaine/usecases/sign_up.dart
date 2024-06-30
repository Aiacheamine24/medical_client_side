import 'package:equatable/equatable.dart';
import 'package:medical_client_side/core/usecase/usecase.dart';
import 'package:medical_client_side/core/utils/typedef.dart';
import 'package:medical_client_side/features/auth/domaine/entites/login_user.dart';
import 'package:medical_client_side/features/auth/domaine/repositories/auth_repository.dart';

class SignUp implements UseCaseWithParams<LoginUserEntity, SignUpParams> {
  // Repository
  final AuthRepository authRepository;
  const SignUp({
    required this.authRepository,
  });

  @override
  ResultFutureWithCustomClassResult<LoginUserEntity> call(
          SignUpParams params) async =>
      authRepository.signUp(
        firstName: params.firstName,
        lastName: params.lastName,
        birthDate: params.birthDate,
        email: params.email,
        password: params.password,
        confirmPassword: params.confirmPassword,
      );
}

class SignUpParams extends Equatable {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props =>
      [firstName, lastName, birthDate, email, password, confirmPassword];
}