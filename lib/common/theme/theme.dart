import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData getAppTheme(context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      fontFamily: "Poppins",
      scaffoldBackgroundColor: AppColors.backgroundColor,
      // colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      textTheme: TextTheme(
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
