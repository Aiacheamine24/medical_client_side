import 'package:flutter/material.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/sign_in_form.dart';

class RightPartContentSignIn extends StatelessWidget {
  const RightPartContentSignIn({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    "Welcome Back, Please login to your account",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center, // Center the text
                  ),
                  gapH20,
                  // Sign-in form
                  const SignInForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
