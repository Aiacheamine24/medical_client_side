import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_client_side/core/common/widgets/custom_snak_bar.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/sign_up_form.dart';

class RightPartContentSignUp extends StatelessWidget {
  const RightPartContentSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Width
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(width >= 600 ? Sizes.p64 : Sizes.p16),
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(width >= 900 ? Sizes.p64 : Sizes.p16),
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor.withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.p24)),
      ),
      child: Row(
        children: [
          // Image section (conditional)
          if (width >= 845)
            Flexible(
              flex: 1,
              child: Image.asset(
                'assets/images/auth_background_01.png',
                fit: BoxFit.cover,
              ),
            ),

          // Gap between image and form
          if (width >= 845) gapW20,

          // Form section
          Flexible(
            flex: 2, // Increase the flex to make it occupy more space
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailure) {
                        return customSnackBar(context,
                            message: state.message, type: 'error');
                      }
                      if (state is AuthSuccess) {
                        context.go('/home');
                      }
                    },
                    child: Container(),
                  ),
                  Text(
                    "Welcome to our platform",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center, // Center the text
                  ),
                  gapH20,
                  // Sign-up form
                  const SignUpForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
