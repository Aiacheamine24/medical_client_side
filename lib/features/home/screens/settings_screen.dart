import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';
  static const IconData actifIcon = Icons.settings;
  static const IconData inactifIcon = Icons.settings_outlined;
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
