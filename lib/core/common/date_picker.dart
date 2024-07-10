import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Assurez-vous d'ajouter ce package dans votre pubspec.yaml

class CustomDateForm extends StatelessWidget {
  final String hintText;
  final String label;
  final DateTime? initialValue;
  final DateTime firstDate;
  final DateTime lastDate;
  final TextEditingController controller;
  final FocusNode focusNode;

  const CustomDateForm({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.focusNode,
    this.initialValue,
    required this.firstDate,
    required this.lastDate,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialValue ?? DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).dialogBackgroundColor,
              onPrimary: Theme.of(context).scaffoldBackgroundColor,
              surface: Theme.of(context).dialogBackgroundColor,
              onSurface: Theme.of(context).scaffoldBackgroundColor,
            ),
            dialogBackgroundColor: Theme.of(context).dialogBackgroundColor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != initialValue) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            filled: true,
            fillColor: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
            labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
