import 'package:flutter/material.dart';
import 'package:medical_client_side/core/app/app.dart';
import 'package:medical_client_side/core/inject_dependencies/inject.dart';
import 'package:medical_client_side/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Set path strategy
  setPathUrlStrategy();
  // Initialize dependencies
  await initDependencies();
  // Run the app
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) => getItInstance(),
      ),
    ],
    child: const MyEntryPointApp(),
  ));
}
