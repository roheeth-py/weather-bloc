import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme {
  static TextTheme productSansTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Product Sans',
      fontSize: 48.sp,
      fontWeight: FontWeight.bold,
      height: 40 / 32,
      letterSpacing: -0.5,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Product Sans',
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      height: 36 / 28,
      letterSpacing: -0.4,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Product Sans',
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      height: 32 / 24,
      letterSpacing: -0.3,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Product Sans',
      fontSize: 18.sp,
      fontWeight: FontWeight.normal,
      height: 24 / 18,
      letterSpacing: 0,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Product Sans',
      fontSize: 16.sp,
      height: 20 / 16,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Product Sans',
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      height: 16 / 14,
      letterSpacing: 0,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Product Sans',
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      height: 18 / 14,
      letterSpacing: 1.25,
      color: Colors.white,
    ),
  );
}
