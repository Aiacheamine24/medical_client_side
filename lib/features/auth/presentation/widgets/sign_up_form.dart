import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_client_side/core/common/widgets/custom_text_form.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/core/theme/app_pallete.dart';
import 'package:medical_client_side/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/first_part_sign_up.dart';
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
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final birthDateController = TextEditingController();
    // Next widget function
    void nextWidget({int index = 0}) {
      print('Next widget');
    }
    // Previous widget function

    // Sign-up function
    void signUp() {}
    // Width
    final width = MediaQuery.of(context).size.width;
    return Form(
      child: Container(
          margin: EdgeInsets.only(right: width >= 900 ? Sizes.p20 : 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // FirstPartSignUp(
              //   emailFocusNode: emailFocusNode,
              //   passwordFocusNode: passwordFocusNode,
              //   confirmPasswordFocusNode: confirmPasswordFocusNode,
              //   emailController: emailController,
              //   passwordController: passwordController,
              //   confirmPasswordController: confirmPasswordController,
              //   nextWidget: nextWidget,
              // ),
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
