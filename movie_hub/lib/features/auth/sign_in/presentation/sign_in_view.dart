import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:movie_hub/features/movie_dashboard/movie_dashboard.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const route = 'sign_in';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      usePadding: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            'Lights, Camera, Sign In!',
            fontSize: sp(kfsExtraLarge),
            fontWeight: FontWeight.w600,
          ),
          vSpace(kfsVeryTiny),
          TextWidget(
            'Your Movie Journey Continues.',
            fontSize: sp(kfsTiny),
            fontWeight: FontWeight.w300,
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
          vSpace(kMinute),
          Align(
            alignment: Alignment.topRight,
            child: TextWidget(
              'Forgot your Password?',
              fontSize: sp(kfsVeryTiny),
              onTap: () =>
                  AppRouter.instance.navigateTo(ForgotPasswordView.route),
              fontWeight: FontWeight.w300,
            ),
          ),
          vSpace(kfs70),
          Button(
            text: 'Let\'s Continue!',
            circular: true,
            onTap: () =>
                AppRouter.instance.navigateToAndReplace(NavBarView.route),
          ),
          vSpace(kfsSuperLarge),
          Center(
            child: RichTextWidget(
              'Don\'t have an account?  ',
              'Sign up',
              onTap: TapGestureRecognizer()
                ..onTap = () => AppRouter.instance.navigateTo(SignUpView.route),
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      useSingleScroll: true,
    );
  }
}
