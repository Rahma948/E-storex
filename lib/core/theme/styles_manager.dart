import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';

class StylesManager {
  static TextStyle getTitleStyle({Color? color}) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.black,
      );

  static TextStyle getBodyStyle({Color? color}) => TextStyle(
        fontSize: 16.sp,
        color: color ?? AppColors.black,
      );

  static TextStyle getSmallStyle({Color? color}) => TextStyle(
        fontSize: 13.sp,
        color: color ?? AppColors.grey,
      );
}
