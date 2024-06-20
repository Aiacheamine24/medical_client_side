import 'package:flutter/material.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/right_content_signin.dart';

class SignInScreen extends StatelessWidget {
  /// Default name for the route
  static const String routeName = '/sign-in';

  const SignInScreen({super.key});

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
        const RightPartContentSignIn()
      ],
    ));
  }
}
