import 'package:aichat/core/utils/app_colors.dart';
import 'package:aichat/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme() => ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20.sp),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            height: 1.3,
            fontSize: 22.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
