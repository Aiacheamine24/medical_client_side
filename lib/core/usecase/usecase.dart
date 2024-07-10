import 'package:medical_client_side/core/utils/typedef.dart';

abstract interface class UseCaseWithParams<SuccessType, Params> {
  ResultFutureWithCustomClassResult call(Params params);
}

class NoParams {}
