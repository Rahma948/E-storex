import 'package:flutter/material.dart';
import 'colors_manager.dart';
import 'styles_manager.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        titleTextStyle: StylesManager.getTitleStyle(color: AppColors.black),
      ),
      textTheme: TextTheme(
        bodyLarge: StylesManager.getBodyStyle(color: AppColors.black),
        titleLarge: StylesManager.getTitleStyle(color: AppColors.black),
      ),
      iconTheme: const IconThemeData(color: AppColors.black),
      dividerColor: AppColors.lightGrey,

      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.black),
        floatingLabelStyle: TextStyle(color: AppColors.black),
        hintStyle: TextStyle(color: AppColors.black),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
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

      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.white),
        floatingLabelStyle: TextStyle(color: AppColors.white),
        hintStyle: TextStyle(color: AppColors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
      ),
    );
  }
}
