import 'package:equatable/equatable.dart';
import 'package:medical_client_side/core/usecase/usecase.dart';
import 'package:medical_client_side/core/utils/typedef.dart';
import 'package:medical_client_side/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:medical_client_side/features/auth/domaine/entites/login_user.dart';
import 'package:medical_client_side/features/auth/domaine/repositories/auth_repository.dart';

class SignIn implements UseCaseWithParams<LoginUserEntity, SignInParams> {
  // Repository
  final AuthRepository authRepository = AuthRepositoryImpl();

  @override
  ResultFutureWithCustomClassResult<LoginUserEntity> call(
          SignInParams params) async =>
      authRepository.signIn(
        identifier: params.identifier,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  final String identifier;
  final String password;

  const SignInParams({
    required this.identifier,
    required this.password,
  });

  @override
  List<Object?> get props => [identifier, password];
}
