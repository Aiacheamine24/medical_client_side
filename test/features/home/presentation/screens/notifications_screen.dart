import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = '/notifications';
  static const IconData actifIcon = Icons.notifications;
  static const IconData inactifIcon = Icons.notifications_outlined;
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}
