import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';

class StylesManager {
  static TextStyle getTitleStyle({Color? color}) => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.black,
  );

  static TextStyle getSubtitleStyle({Color? color}) =>
      TextStyle(fontSize: 14.sp, color: color ?? Color(0xFF808080));

  static TextStyle getBodyStyle({Color? color}) =>
      TextStyle(fontSize: 14.sp, color: color ?? AppColors.black);

  static TextStyle getSmallStyle({Color? color}) =>
      TextStyle(fontSize: 13.sp, color: color ?? AppColors.grey);
  static TextStyle getSmallStyleBlack({Color? color}) =>
      TextStyle(fontSize: 14.sp, color: color ?? AppColors.black);

  static TextStyle getBlueLinkText({Color? color}) =>
      TextStyle(fontSize: 12.sp, color: color ?? AppColors.kPrimaryColor);
}
