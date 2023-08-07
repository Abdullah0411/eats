import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/constants/constants.dart';

class EatsThemes {
  static final main = ThemeData(
      iconTheme: const IconThemeData(
        color: AppColors.green, //change your color here
      ),
      fontFamily: FontConst.plexSansArabic,
      scaffoldBackgroundColor: AppColors.cultured,
      primaryColor: AppColors.primary,
      dividerColor: Colors.transparent,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.white,
      ),
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 70.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
          headlineMedium: TextStyle(
              fontSize: 50.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
          titleLarge: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
          titleMedium: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
          bodyLarge: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
          bodyMedium: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
          bodySmall: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
          displaySmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey)),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      backgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cultured,
        elevation: 0,
      ));
}
