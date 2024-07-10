import 'package:flutter/material.dart';
import 'package:medical_client_side/core/common/widgets/custom_text_form.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/core/theme/app_pallete.dart';

class FirstPartSignUp extends StatelessWidget {
  const FirstPartSignUp({
    super.key,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nextWidget,
  });

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function nextWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          controller: emailController,
          hintText: 'Enter your e-mail adress *',
          label: "E-mail adress *",
          focusNode: emailFocusNode,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(passwordFocusNode),
          validator: (value) =>
              value == null || value.isEmpty ? 'E-mail is required' : null,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
          decoration: InputDecoration(
            label: Text(
              "E-mail adress *",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            hintText: "Enter your e-mail adress *",
            filled: true,
            fillColor: AppPallete.secondaryBackgroundColor.withOpacity(0.5),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        gapH20,
        CustomTextForm(
          obscureText: true,
          controller: passwordController,
          hintText: 'Enter your password *',
          label: "Password *",
          focusNode: passwordFocusNode,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(confirmPasswordFocusNode),
          validator: (value) => value == null || value.isEmpty
              ? value!.length < 6
                  ? 'Password must be at least 6 characters'
                  : 'Password is required'
              : 'Password is required',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
          decoration: InputDecoration(
            label: Text(
              "Password *",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            hintText: "Enter your password *",
            filled: true,
            fillColor: AppPallete.secondaryBackgroundColor.withOpacity(0.5),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        gapH20,
        CustomTextForm(
          obscureText: true,
          controller: confirmPasswordController,
          hintText: 'Confirm your password *',
          label: "Confirm Password *",
          focusNode: confirmPasswordFocusNode,
          onFieldSubmitted: (_) => nextWidget(1),
          validator: (value) => value == null || value.isEmpty
              ? 'Password confirmation is required'
              : value != passwordController.text
                  ? 'Passwords do not match'
                  : null,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
          decoration: InputDecoration(
            label: Text(
              "Confirm Password *",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            hintText: "Confirm your password *",
            filled: true,
            fillColor: AppPallete.secondaryBackgroundColor.withOpacity(0.5),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        gapH20,
        ElevatedButton(
          onPressed: () => nextWidget(index: 1),
          child: Text(
            "Next step",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
            // Positioning the button top left
          ),
        ),
      ],
    );
  }
}
