import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_hub/cores/components/buttons.dart';
import 'package:movie_hub/cores/components/scaffold_widget.dart';
import 'package:movie_hub/cores/components/text_widget.dart';
import 'package:movie_hub/cores/components/textfield_widget.dart';
import 'package:movie_hub/cores/constants/asset.dart';
import 'package:movie_hub/cores/constants/font_size.dart';
import 'package:movie_hub/cores/constants/palette.dart';
import 'package:movie_hub/cores/navigator/app_router.dart';
import 'package:movie_hub/cores/utils/extension.dart';
import 'package:movie_hub/features/movie_dashboard/home/presentation/home_view.dart';

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
            hintText: 'Input your user name',
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
            hintText: 'Input your email',
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
            hintText: 'Input your desired password',
            isPassword: true,
            prefixIcon: SvgPicture.asset(
              lockIcon,
              fit: BoxFit.scaleDown,
              color: kcWhiteColor.withOpacity(0.8),
            ),
          ),
          100.sH,
          Button(
            text: 'Let\'s Go!',
            circular: true,
            onTap: () => AppRouter.instance.navigateTo(HomeView.route),
          )
        ],
      ),
      useSingleScroll: true,
    );
  }
}
