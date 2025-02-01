import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBgColor,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusColor: AppColors.primaryColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: AppColors.lightGrey,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.lightGrey,
        maximumSize: Size.fromHeight(48),
        minimumSize: Size.fromHeight(48),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: AppColors.white,
        ),
      ),
    ),
  );
}
