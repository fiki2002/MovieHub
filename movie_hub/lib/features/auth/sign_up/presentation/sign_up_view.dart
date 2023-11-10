import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const route = 'sign_up';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      usePadding: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            'Lights, Camera, Sign Up!',
            fontSize: sp(kfsExtraLarge),
            fontWeight: FontWeight.w600,
          ),
          vSpace(kfsVeryTiny),
          TextWidget(
            'Your Movie Journey Begins Here.',
            fontSize: sp(kfsTiny),
            fontWeight: FontWeight.w300,
          ),
          vSpace(kGlobalPadding),
          CustomTextField(
            title: 'User Name',
            hintText: 'John Doe',
            keyboardType: TextInputType.name,
            prefixIcon: personIcon.svg,
          ),
          vSpace(kGlobalPadding),
          CustomTextField(
            title: 'Email',
            hintText: 'johndoe@gmail.com',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: mailIcon.svg,
          ),
          vSpace(kGlobalPadding),
          CustomTextField(
            title: 'Password',
            hintText: '..........',
            isPassword: true,
            prefixIcon: lockIcon.svg,
          ),
          vSpace(kfs70),
          Button(
            text: 'Let\'s Go!',
            circular: true,
            onTap: () => goReplace(NavBarView.route),
          ),
          vSpace(kfsSuperLarge),
          Center(
            child: RichTextWidget(
              'Already have an account?  ',
              'Sign in',
              onTap: TapGestureRecognizer()
                ..onTap = () => goTo(SignInView.route),
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
      useSingleScroll: true,
    );
  }
}
