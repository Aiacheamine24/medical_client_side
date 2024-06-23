import 'package:flutter/material.dart';
import 'package:medical_client_side/core/common/date_picker.dart';
import 'package:medical_client_side/core/common/widgets/custom_text_form.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/core/theme/app_pallete.dart';

class SecondPartSignUp extends StatelessWidget {
  const SecondPartSignUp({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.birthDateController,
    required this.nextWidget,
    required this.firstNameFocusNode,
    required this.lastNameFocusNode,
    required this.birthDateFocusNode,
    required this.signUp,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthDateController;
  final Function nextWidget;
  final FocusNode firstNameFocusNode;
  final FocusNode lastNameFocusNode;
  final FocusNode birthDateFocusNode;
  final Function signUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: IconButton(
                onPressed: () => nextWidget(0),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ],
        ),
        CustomTextForm(
          hintText: "Enter your first name *",
          label: "First name *",
          controller: firstNameController,
          focusNode: firstNameFocusNode,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(lastNameFocusNode),
          validator: (value) =>
              value == null || value.isEmpty ? 'First name is required' : null,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
          decoration: InputDecoration(
            label: Text(
              "First name *",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            hintText: "Enter your first name *",
            filled: true,
            fillColor: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        gapH20,
        CustomTextForm(
          hintText: "Enter your last name *",
          label: "Last name *",
          controller: lastNameController,
          focusNode: lastNameFocusNode,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(birthDateFocusNode),
          validator: (value) =>
              value == null || value.isEmpty ? 'Last name is required' : null,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
          decoration: InputDecoration(
            label: Text(
              "Last name *",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            hintText: "Enter your last name *",
            filled: true,
            fillColor: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        gapH20,
        CustomDateForm(
          hintText: "Select your birth date *",
          label: "Birth date *",
          controller: birthDateController,
          focusNode: birthDateFocusNode,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ),
        gapH8,
        Row(
          children: [
            Checkbox.adaptive(
                value: false,
                onChanged: (_) => {},
                activeColor: Colors.white,

                // Add icon when checked
                checkColor: AppPallete.primaryColor),
            Text(
              "Remember me",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
        gapH20,
        ElevatedButton(
          onPressed: () => signUp(),
          child: Text(
            "Sign In",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
