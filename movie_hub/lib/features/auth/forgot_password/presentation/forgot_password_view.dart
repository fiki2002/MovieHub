import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const route = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            'Oops! Need a New Password?',
            fontSize: kfsExtraLarge,
            fontWeight: FontWeight.w600,
          ),
          vSpace(kfsVeryTiny),
          TextWidget(
            'Let\'s Get You Back On Track.',
            fontSize: sp(kfsTiny),
            fontWeight: FontWeight.w300,
          ),
          vSpace(kGlobalPadding),
          CustomTextField(
            title: 'Email',
            hintText: 'Input your email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: mailIcon.svg,
          ),
          vSpace(kXtremeLarge),
          Button(
            circular: true,
            text: 'Continue',
            onTap: () {},
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
          )
        ],
      ),
    );
  }
}
