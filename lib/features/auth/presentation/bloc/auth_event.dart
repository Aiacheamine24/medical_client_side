part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class FirstStepRegisterEvent extends AuthEvent {}

final class SecondStepRegisterEvent extends AuthEvent {}

final class LoginEvent extends AuthEvent {
  final String identifier;
  final String password;

  const LoginEvent({
    required this.identifier,
    required this.password,
  });

  @override
  List<Object> get props => [identifier, password];
}

final class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final DateTime birthDate;
  final String firstName;
  final String lastName;

  const RegisterEvent({
    required this.email,
    required this.password,
    required this.birthDate,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [
        email,
        password,
        birthDate,
        firstName ?? '',
        lastName ?? '',
      ];

  get confirmPassword => null;
}
