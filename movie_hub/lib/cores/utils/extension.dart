import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
