import 'package:medical_client_side/core/utils/typedef.dart';
import 'package:medical_client_side/features/auth/domaine/entites/login_user.dart';

class LoginUserModel extends LoginUserEntity {
  final String accessToken;
  final String refreshToken;

  const LoginUserModel({
    required super.success,
    required super.message,
    required super.id,
    required super.missingFields,
    required this.accessToken,
    required this.refreshToken,
  });
  // From Map
  factory LoginUserModel.fromMap(DataMap map) {
    return LoginUserModel(
      success: map['success'],
      message: map['msg'] ?? "",
      id: map['data']['id'],
      missingFields: List<String>.from(map['data']['missingFields'] ?? []),
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }

  // CopyWith
  LoginUserModel copyWith({
    bool? success,
    String? message,
    String? id,
    List<String>? missingFields,
    String? accessToken,
    String? refreshToken,
  }) {
    return LoginUserModel(
      success: success ?? this.success,
      message: message ?? this.message,
      id: id ?? this.id,
      missingFields: missingFields ?? this.missingFields,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
