// Go router instance
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_client_side/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:medical_client_side/features/auth/presentation/screens/sign_up_screen.dart';

final goRouterIntance = GoRouter(
  initialLocation: SignInScreen.routeName,
  routes: [
    GoRoute(
      // Add Global Key to the route to build the page only once and keep the state
      path: SignInScreen.routeName,
      pageBuilder: (context, state) =>
          const MaterialPage(child: SignInScreen()),
    ),
    GoRoute(
      // Add Global Key to the route to build the page only once and keep the state
      path: SignUpScreen.routeName,
      pageBuilder: (context, state) =>
          const MaterialPage(child: SignUpScreen()),
    ),
  ],
);
