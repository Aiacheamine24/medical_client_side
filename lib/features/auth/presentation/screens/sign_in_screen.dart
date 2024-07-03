import 'package:flutter/material.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/right_content_signin.dart';

class SignInScreen extends StatelessWidget {
  /// Default name for the route
  static const String routeName = '/sign-in';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const RightPartContentSignIn(),
    );
  }
}
