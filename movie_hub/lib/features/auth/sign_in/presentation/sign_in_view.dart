import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/cores/utils/extension.dart';
import 'package:movie_hub/features/auth/forgot_password/presentation/forgot_password.dart';
import 'package:movie_hub/features/auth/sign_up/presentation/sign_up_view.dart';

import '../../../../cores/components/buttons.dart';
import '../../../../cores/components/scaffold_widget.dart';
import '../../../../cores/components/text_widget.dart';
import '../../../../cores/components/textfield_widget.dart';
import '../../../../cores/constants/asset.dart';
import '../../../../cores/constants/font_size.dart';
import '../../../../cores/navigator/app_router.dart';
import '../../../movie_dashboard/home/presentation/home_view.dart';

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
            fontSize: kfsExtraLarge.sp,
            fontWeight: FontWeight.w600,
          ),
          kfsVeryTiny.sH,
          TextWidget(
            'Your Movie Journey Continues.',
            fontSize: kfsTiny.sp,
            fontWeight: FontWeight.w300,
          ),
          kGlobalPadding.sH,
          CustomTextField(
            title: 'Email',
            hintText: 'johndoe@gmail.com',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: mailIcon.svg,
          ),
          kGlobalPadding.sH,
          CustomTextField(
            title: 'Password',
            hintText: '..........',
            isPassword: true,
            prefixIcon: lockIcon.svg,
          ),
          kMinute.sH,
          Align(
            alignment: Alignment.topRight,
            child: TextWidget(
              'Forgot your Password?',
              fontSize: kfsVeryTiny.sp,
              onTap: () =>
                  AppRouter.instance.navigateTo(ForgotPasswordView.route),
              fontWeight: FontWeight.w300,
            ),
          ),
          70.sH,
          Button(
            text: 'Let\'s Continue!',
            circular: true,
            onTap: () =>
                AppRouter.instance.navigateToAndReplace(HomeView.route),
          ),
          kfsSuperLarge.sH,
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
