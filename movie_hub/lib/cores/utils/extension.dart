import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_hub/cores/constants/palette.dart';

/// extension for sizedBox spacing
///
extension SizedBoxExtension on num {
  Widget get sH => SizedBox(
        height: h,
      );

  Widget get sW => SizedBox(
        width: w,
      );
}

/// extension for SVG
///
extension SvgExtension on String {
  /// SVG with color
  SvgPicture get svg => SvgPicture.asset(
        this,
        fit: BoxFit.scaleDown,
        color: kcWhiteColor.withOpacity(0.8),
      );
}
