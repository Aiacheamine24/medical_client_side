import 'package:equatable/equatable.dart';

class LoginUserEntity extends Equatable {
  final bool success;
  final String message;
  final String id;
  final List<String> missingFields;

  const LoginUserEntity({
    required this.success,
    required this.message,
    required this.id,
    required this.missingFields,
  });

  @override
  List<Object?> get props => [success, message, id, missingFields];
}
