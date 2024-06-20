import 'package:flutter/material.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/features/auth/presentation/widgets/sign_in_form.dart';

class RightPartContentSignIn extends StatelessWidget {
  const RightPartContentSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Flexible(
      flex: 1,
      child: Container(
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
            width >= 845 ? gapW20 : const SizedBox(),
            // Form section
            Flexible(
              flex: 1,
              child: SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back, Please login to your account",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      gapH20,
                      // Sign-in form
                      const SignInForm(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
