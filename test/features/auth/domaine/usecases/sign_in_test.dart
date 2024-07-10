import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_client_side/core/errors/failure.dart';
import 'package:medical_client_side/features/auth/domaine/entites/login_user.dart';
import 'package:medical_client_side/features/auth/domaine/repositories/auth_repository.dart';
import 'package:medical_client_side/features/auth/domaine/usecases/sign_in.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  // UseCase
  late SignIn usecase;
  // Repository
  late AuthRepository repository;
  // setUp
  setUp(() {
    repository = MockAuthRepository();
    usecase = SignIn();
  });

  // Group of tests
  group("SignIn Use case Test", () {
    // Test case
    test("Should call [Respository.signIn] and return a Right Success",
        () async {
      // arrange
      const tparams = SignInParams(
        identifier: 'identifier',
        password: 'password',
      );
      when(() => repository.signIn(
            identifier: any(named: 'identifier'),
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
      verify(() => repository.signIn(
            identifier: any(named: 'identifier'),
            password: any(named: 'password'),
          )).called(1);
    });

    // Test case
    test("Should call [Respository.signIn] and return a Left Failure",
        () async {
      // arrange
      const tparams = SignInParams(
        identifier: 'identifier',
        password: 'password',
      );
      when(() => repository.signIn(
                identifier: any(named: 'identifier'),
                password: any(named: 'password'),
              ))
          .thenAnswer(
              (_) async => const Left(UnExpectedFailure(message: "Failure")));
      // act
      final result = await usecase(tparams);
      // assert
      expect(result, equals(const Left(UnExpectedFailure(message: "Failure"))));
      verify(() => repository.signIn(
            identifier: tparams.identifier,
            password: tparams.password,
          )).called(1);
    });
  });
}
