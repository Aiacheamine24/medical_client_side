import 'package:flutter/material.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/right_content_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  /// Default name for the route
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Flexible(
              flex: 1,
              child: Image.asset(
                'assets/images/auth_background.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )),
          const RightPartContentSignUp()
        ],
      ),
    );
  }
}
