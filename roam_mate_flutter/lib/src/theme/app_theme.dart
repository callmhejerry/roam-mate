import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    fontFamily: "Poppins",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Color(0xff333333),
        maximumSize: Size.fromHeight(48),
        minimumSize: Size.fromHeight(48),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          // fontSize: 16.spMin,
          color: AppColors.white,
        ),
      ),
    ),
  );
}
