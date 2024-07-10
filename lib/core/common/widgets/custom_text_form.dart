import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
    this.style,
    this.decoration,
    required this.hintText,
    required this.label,
    required this.controller,
    this.obscureText = false,
  });

  final FocusNode? focusNode;
  final Function(void)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final InputDecoration? decoration;
  final String hintText;
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode ?? FocusNode(),
      onFieldSubmitted: onFieldSubmitted ?? (_) {},
      validator: validator ?? (_) => null,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      decoration: decoration ??
          InputDecoration(
            label: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            hintText: hintText,
            filled: true,
            fillColor: Theme.of(context).primaryColor.withOpacity(0.5),
            hintStyle: Theme.of(context).textTheme.bodyMedium,
          ),
    );
  }
}
