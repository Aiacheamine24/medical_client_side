import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_client_side/core/errors/failure.dart';
import 'package:medical_client_side/features/auth/domaine/entites/login_user.dart';
import 'package:medical_client_side/features/auth/domaine/repositories/auth_repository.dart';
import 'package:medical_client_side/features/auth/domaine/usecases/sign_up.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  // UseCase
  late SignUp usecase;
  // Repository
  late AuthRepository repository;
  // setUp
  setUp(() {
    repository = MockAuthRepository();
    usecase = SignUp();
  });

  // Group of tests
  group("SignUp Use case Test", () {
    // Test case
    test('should call [Respository.createUser] and return a Right Success',
        () async {
      // arrange
      final tparams = SignUpParams(
        firstName: 'firstName',
        lastName: 'lastName',
        birthDate: DateTime(2021, 1, 1), // DateTime(2021, 1, 1)
        email: 'email',
        password: 'password',
      );
      when(() => repository.signUp(
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            birthDate: any(named: 'birthDate'),
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Right(LoginUserEntity(
            id: 'id',
            message: 'message',
            missingFields: [],
            success: true,
          )));
      // act
      final result = await usecase(tparams);
      // assert
      expect(
          result,
          equals(const Right(LoginUserEntity(
            id: 'id',
            message: 'message',
            missingFields: [],
            success: true,
          ))));
      verify(() => repository.signUp(
            firstName: tparams.firstName,
            lastName: tparams.lastName,
            birthDate: tparams.birthDate,
            email: tparams.email,
            password: tparams.password,
          )).called(1);
    });

    test('should call [Respository.createUser] and return a Left Failure',
        () async {
      // arrange
      final tparams = SignUpParams(
        firstName: 'firstName',
        lastName: 'lastName',
        birthDate: DateTime(2021, 1, 1), // DateTime(2021, 1, 1)
        email: 'email',
        password: 'password',
      );
      when(() => repository.signUp(
                firstName: any(named: 'firstName'),
                lastName: any(named: 'lastName'),
                birthDate: any(named: 'birthDate'),
                email: any(named: 'email'),
                password: any(named: 'password'),
              ))
          .thenAnswer(
              (_) async => const Left(UnExpectedFailure(message: 'message')));
      // act
      final result = await usecase(tparams);
      // assert
      expect(result, equals(const Left(UnExpectedFailure(message: 'message'))));
      verify(() => repository.signUp(
            firstName: tparams.firstName,
            lastName: tparams.lastName,
            birthDate: tparams.birthDate,
            email: tparams.email,
            password: tparams.password,
          )).called(1);
    });
  });
}
