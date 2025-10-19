import 'package:flutter/material.dart';
import 'colors_manager.dart';
import 'styles_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      elevation: 0,
      titleTextStyle: StylesManager.getTitleStyle(),
    ),
    textTheme: TextTheme(
      bodyLarge: StylesManager.getBodyStyle(color: AppColors.black),
      titleLarge: StylesManager.getTitleStyle(color: AppColors.black),
    ),
    iconTheme: const IconThemeData(color: AppColors.black),
    dividerColor: AppColors.lightGrey,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: StylesManager.getTitleStyle(color: AppColors.white),
    ),
    textTheme: TextTheme(
      bodyLarge: StylesManager.getBodyStyle(color: AppColors.white),
      titleLarge: StylesManager.getTitleStyle(color: AppColors.white),
    ),
    iconTheme: const IconThemeData(color: AppColors.white),
    dividerColor: AppColors.darkGrey,
  );
}
