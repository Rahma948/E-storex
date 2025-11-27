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

    // 👇 أضف السطور دي
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: AppColors.black),
      floatingLabelStyle: const TextStyle(color: AppColors.black),
      hintStyle: const TextStyle(color: AppColors.black),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.black),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.black, width: 2),
      ),
    ),
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

    // 👇 وأضف نفس الفكرة للدارك مود
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: AppColors.white),
      floatingLabelStyle: const TextStyle(color: AppColors.white),
      hintStyle: const TextStyle(color: AppColors.white),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: 2),
      ),
    ),
  );
}
