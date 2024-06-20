import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  /// Default name for the route
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign Up Screen'),
      ),
    );
  }
}
