import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_hub/cores/utils/extension.dart';

import '../../../../cores/components/buttons.dart';
import '../../../../cores/components/scaffold_widget.dart';
import '../../../../cores/components/text_widget.dart';
import '../../../../cores/components/textfield_widget.dart';
import '../../../../cores/constants/asset.dart';
import '../../../../cores/constants/font_size.dart';
import '../../../../cores/constants/palette.dart';
import '../../../../cores/navigator/app_router.dart';
import '../../../movie_dashboard/home/presentation/home_view.dart';
import '../../sign_in/presentation/sign_in_view.dart';

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
            fontSize: kfsExtraLarge.sp,
            fontWeight: FontWeight.w600,
          ),
          kfsVeryTiny.sH,
          TextWidget(
            'Your Movie Journey Begins Here.',
            fontSize: kfsTiny.sp,
            fontWeight: FontWeight.w300,
          ),
          kGlobalPadding.sH,
          CustomTextField(
            title: 'User Name',
            hintText: 'John Doe',
            keyboardType: TextInputType.name,
            prefixIcon: SvgPicture.asset(
              personIcon,
              fit: BoxFit.scaleDown,
              color: kcWhiteColor.withOpacity(0.8),
            ),
          ),
          kGlobalPadding.sH,
          CustomTextField(
            title: 'Email',
            hintText: 'johndoe@gmail.com',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: SvgPicture.asset(
              mailIcon,
              fit: BoxFit.scaleDown,
              color: kcWhiteColor.withOpacity(0.8),
            ),
          ),
          kGlobalPadding.sH,
          CustomTextField(
            title: 'Password',
            hintText: '..........',
            isPassword: true,
            prefixIcon: SvgPicture.asset(
              lockIcon,
              fit: BoxFit.scaleDown,
              color: kcWhiteColor.withOpacity(0.8),
            ),
          ),
          70.sH,
          Button(
            text: 'Let\'s Go!',
            circular: true,
            onTap: () => AppRouter.instance.navigateTo(HomeView.route),
          ),
          kfsSuperLarge.sH,
          Center(
            child: RichTextWidget(
              'Already have an account?  ',
              'Sign in',
              onTap: TapGestureRecognizer()
                ..onTap = () => AppRouter.instance.navigateTo(SignInView.route),
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
      useSingleScroll: true,
    );
  }
}
