import 'package:flutter/material.dart';
import 'package:medical_client_side/core/app/app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Set path strategy
  setPathUrlStrategy();
  // Initialize dependencies

  // Run the app
  runApp(const MyEntryPointApp());
}
