import 'package:better_one/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle get titleLarge => TextStyle(
        color: AppColors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get titleSmall => TextStyle(
        color: AppColors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get titleMedium => TextStyle(
        color: AppColors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get bodyLarge => TextStyle(
        color: AppColors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        height: 1.2,
      );
  static TextStyle get bodyMedium => TextStyle(
        color: AppColors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        height: 1.2,
      );
  static TextStyle get bodySmall => TextStyle(
        color: AppColors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        height: 1.2,
      );
}
