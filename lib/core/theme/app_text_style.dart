
import 'package:flutter/material.dart';
import '../core.dart';
class AppTextStyle {
  const AppTextStyle._();
  static const String _INTER = 'Inter';

  static TextStyle _getTextStyle(
      double fontSize, FontWeight fontWeight, Color? color) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: _INTER,
      color: color ?? AppColors.dark,
      fontWeight: fontWeight,
    );
  }

  // regular style
  static TextStyle regular({double size = 16.0, Color? color}) {
    return _getTextStyle(size, FontWeight.w400, color);
  }

// bold text style
  static TextStyle bold({double size = 22.0, Color? color}) {
    return _getTextStyle(size, FontWeight.bold, color);
  }

// semi bold text style
  static TextStyle semiBold({double size = 14.0, Color? color}) {
    return _getTextStyle(size, FontWeight.w600, color);
  }

// semi bold text style underline
  static TextStyle semiBoldUnderline({double size = 14.0, Color? color}) {
    return _getTextStyle(size, FontWeight.w600, color);
  }

// medium text style

  static TextStyle medium({double size = 16.0, Color? color}) {
    return _getTextStyle(size, FontWeight.w500, color);
  }

  static TextStyle getButtonStyle({double size = 14.0}) => TextStyle(
        letterSpacing: 0.8,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: size.sp,
      );
}
