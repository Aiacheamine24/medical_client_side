import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_client_side/core/common/widgets/custom_snak_bar.dart';
import 'package:medical_client_side/core/common/widgets/custom_text_form.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/core/theme/app_pallete.dart';
import 'package:medical_client_side/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:medical_client_side/features/auth/presentation/screens/sign_up_screen.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Focus nodes
    final identifierFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    // Parameters
    final identifierController = TextEditingController(text: 'test@test.com');
    final passwordController = TextEditingController(text: 'test@test');
    // Login function
    void login() {
      final identifier = identifierController.text;
      final password = passwordController.text;
      if (identifierController.text.isEmpty ||
          passwordController.text.isEmpty) {
        return customSnackBar(context,
            message: "Please enter obligatoire fields", type: 'info');
      }
      // Call login function
      context
          .read<AuthBloc>()
          .add(LoginEvent(identifier: identifier, password: password));
    }

    // width
    final width = MediaQuery.of(context).size.width;
    return Form(
      child: Container(
        margin: EdgeInsets.only(right: width >= 900 ? Sizes.p20 : 0),
        child: Column(
          children: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  customSnackBar(context,
                      message: state.message, type: 'error');
                } else if (state is AuthSuccess) {
                  context.go('/home');
                }
              },
              child: Container(),
            ),
            CustomTextForm(
              controller: identifierController,
              hintText: 'Email or Phone number or Personal code',
              label: "Identifier *",
              focusNode: identifierFocusNode,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(passwordFocusNode),
              validator: (value) => value == null || value.isEmpty
                  ? 'Identifier is required'
                  : null,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
              decoration: InputDecoration(
                label: Text(
                  "Identifier *",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                hintText: "Email or Phone number or Personal code",
                filled: true,
                fillColor: AppPallete.secondaryBackgroundColor.withOpacity(0.5),
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            gapH20,
            CustomTextForm(
              controller: passwordController,
              hintText: 'Password',
              label: "Password *",
              focusNode: passwordFocusNode,
              onFieldSubmitted: (_) => login(),
              validator: (value) => value == null || value.isEmpty
                  ? 'Password is required'
                  : null,
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
                hintText: "Password",
                filled: true,
                fillColor: AppPallete.secondaryBackgroundColor.withOpacity(0.5),
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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

                // Forgot password
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            gapH20,
            ElevatedButton(
              onPressed: () => login(),
              child: Text(
                "Sign In",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            // Sign up link
            gapH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
                TextButton(
                  onPressed: () => context.go(SignUpScreen.routeName),
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppPallete.backgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
