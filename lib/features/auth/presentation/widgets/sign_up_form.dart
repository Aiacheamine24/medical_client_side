import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_client_side/core/common/widgets/custom_snak_bar.dart';
// import 'package:medical_client_side/core/common/widgets/custom_text_form.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/core/theme/app_pallete.dart';
import 'package:medical_client_side/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:medical_client_side/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/first_part_sign_up.dart';
// import 'package:medical_client_side/features/auth/presentation/widgets/first_part_sign_up.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/second_part_signup.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Focus nodes
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    final confirmPasswordFocusNode = FocusNode();
    final firstNameFocusNode = FocusNode();
    final lastNameFocusNode = FocusNode();
    final birthDateFocusNode = FocusNode();

    // Parameters
    final emailController = TextEditingController(text: "noadmin1@gmail.com");
    final passwordController = TextEditingController(text: "aaaaaa");
    final confirmPasswordController = TextEditingController(text: "aaaaaa");
    final firstNameController = TextEditingController(text: "noadmin");
    final lastNameController = TextEditingController(text: "1");
    final birthDateController = TextEditingController(text: "2021-01-01");
    // Next widget function
    void nextWidget({int index = 0}) {
      if (index == 0) {
        context.read<AuthBloc>().add(FirstStepRegisterEvent());
      } else if (index == 1) {
        context.read<AuthBloc>().add(SecondStepRegisterEvent());
      }
    }
    // Previous widget function

    // Sign-up function
    void signUp() {
      final email = emailController.text;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;
      final firstName = firstNameController.text;
      final lastName = lastNameController.text;
      final birthDate = birthDateController.text;

      if (password != confirmPassword) {
        customSnackBar(context,
            message: "Passwords do not match", type: 'error');
      }
      if (password.length < 6) {
        customSnackBar(context,
            message: "Password must be at least 6 characters", type: 'error');
      }
      if (email.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty ||
          firstName.isEmpty ||
          lastName.isEmpty ||
          birthDate.isEmpty) {
        customSnackBar(context,
            message: "All fields are required", type: 'error');
      }

      context.read<AuthBloc>().add(RegisterEvent(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate.isNotEmpty
              ? DateTime.parse(birthDate)
              : DateTime(1, 1, 1)));
    }

    // Width
    final width = MediaQuery.of(context).size.width;
    return Form(
      child: Container(
          margin: EdgeInsets.only(right: width >= 900 ? Sizes.p20 : 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is FirstStepRegister) {
                  return Column(
                    children: [
                      FirstPartSignUp(
                        emailFocusNode: emailFocusNode,
                        passwordFocusNode: passwordFocusNode,
                        confirmPasswordFocusNode: confirmPasswordFocusNode,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        nextWidget: nextWidget,
                      ),
                      gapH20,
                    ],
                  );
                } else if (state is SecondStepRegister) {
                  return Column(
                    children: [
                      SecondPartSignUp(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        birthDateController: birthDateController,
                        nextWidget: nextWidget,
                        firstNameFocusNode: firstNameFocusNode,
                        lastNameFocusNode: lastNameFocusNode,
                        birthDateFocusNode: birthDateFocusNode,
                        signUp: signUp,
                      ),
                      gapH20,
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      FirstPartSignUp(
                        emailFocusNode: emailFocusNode,
                        passwordFocusNode: passwordFocusNode,
                        confirmPasswordFocusNode: confirmPasswordFocusNode,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        nextWidget: nextWidget,
                      ),
                      gapH20,
                    ],
                  );
                }
              }),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () => context.go(SignInScreen.routeName),
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppPallete.backgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
