import 'package:flutter/material.dart';
import 'package:medical_client_side/core/constants/app_config.dart';
import 'package:medical_client_side/core/routing/router_default.dart';
import 'package:medical_client_side/core/theme/theme.dart';

class MyEntryPointApp extends StatelessWidget {
  const MyEntryPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      routerConfig: goRouterIntance,
      routeInformationParser: null,
      routeInformationProvider: null,
      theme: AppTheme.lightTheme,
    );
  }
}
