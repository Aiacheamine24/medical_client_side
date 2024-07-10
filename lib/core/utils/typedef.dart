import 'package:dartz/dartz.dart';
import 'package:medical_client_side/core/errors/failure.dart';

/// Type definition for a function that returns a [<Future<Either<Failure, Type>>]
typedef ResultFutureWithCustomClassResult<T> = Future<Either<Failure, T>>;

/// Type definition for a function that returns a [<Future<Either<Failure, void>>]
typedef ResultFutureWithVoidResult = ResultFutureWithCustomClassResult<void>;

/// Type definition for a function that returns a [<Future<Either<Failure, List<Type>>>]
typedef DataMap = Map<String, dynamic>;
