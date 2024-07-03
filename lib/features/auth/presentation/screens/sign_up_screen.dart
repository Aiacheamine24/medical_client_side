import 'package:flutter/material.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/right_content_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  /// Default name for the route
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const RightPartContentSignUp());
  }
}
