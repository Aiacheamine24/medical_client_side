import 'package:flutter/material.dart';

void customSnackBar(
  BuildContext context, {
  required String message,
  required String type,
}) {
  Color backgroundColor;
  switch (type) {
    case 'error':
      backgroundColor = Colors.red;
      break;
    case 'info':
      backgroundColor = Colors.blue;
      break;
    case 'warning':
      backgroundColor = Colors.orange;
      break;
    default:
      backgroundColor = Colors.grey;
  }

  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
