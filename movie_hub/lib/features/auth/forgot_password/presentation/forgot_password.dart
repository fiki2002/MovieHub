import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_hub/cores/components/buttons.dart';
import 'package:movie_hub/cores/utils/extension.dart';

import '../../../../cores/components/scaffold_widget.dart';
import '../../../../cores/components/text_widget.dart';
import '../../../../cores/components/textfield_widget.dart';
import '../../../../cores/constants/asset.dart';
import '../../../../cores/constants/font_size.dart';
import '../../../../cores/constants/palette.dart';
import '../../../../cores/navigator/app_router.dart';
import '../../sign_up/presentation/sign_up_view.dart';

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
          TextWidget(
            'Oops! Need a New Password?',
            fontSize: kfsExtraLarge.sp,
            fontWeight: FontWeight.w600,
          ),
          kfsVeryTiny.sH,
          TextWidget(
            'Let\'s Get You Back On Track.',
            fontSize: kfsTiny.sp,
            fontWeight: FontWeight.w300,
          ),
          kGlobalPadding.sH,
          CustomTextField(
            title: 'Email',
            hintText: 'Input your email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: SvgPicture.asset(
              mailIcon,
              fit: BoxFit.scaleDown,
              color: kcWhiteColor.withOpacity(0.8),
            ),
          ),
          kXtremeLarge.sH,
          Button(
            circular: true,
            text: 'Continue',
            onTap: () {},
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
          )
        ],
      ),
    );
  }
}
