import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screens/widgets/widgets.dart';
import '../core.dart';

class AppTheme {
  const AppTheme._();
  static ThemeData style() => ThemeData(
        // primarySwatch: AppColors.primary_SWATCH,
        fontFamily: 'Inter',
        primaryColor: AppColors.primary,

        canvasColor: AppColors.white,
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.white),
        dividerTheme: const DividerThemeData(color: AppColors.greyF3),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onSecondary: Colors.white,
          surface: Colors.black,
          onSurface: Colors.black,
          secondary: Colors.black,
        ),
        cardTheme: const CardTheme(color: AppColors.white),
        dialogTheme: DialogTheme(shape: AppShape.circularBorder(radius: 16)),

        platform: TargetPlatform.iOS,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
        ),

        buttonTheme: ButtonThemeData(
          height: 55.h,
          minWidth: 405.w,
          shape: AppShape.circularBorder(),
          buttonColor: AppColors.primary,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            textStyle: AppTextStyle.medium(size: 10),
            fixedSize: Size(405.w, 53.h),
          ),
        ),

        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
        ),

        tabBarTheme: TabBarTheme(
          labelColor: AppColors.dark,
          labelStyle: AppTextStyle.semiBold(size: 18),
          unselectedLabelStyle: AppTextStyle.semiBold(size: 18),
          unselectedLabelColor: AppColors.dark,
          indicatorSize: TabBarIndicatorSize.label,
        ),

        // App bar theme
        appBarTheme: AppBarTheme(
          centerTitle: false,
          backgroundColor: AppColors.primary,
          elevation: 4,
          shadowColor: AppColors.grey,
          iconTheme: const IconThemeData(color: AppColors.white),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light),
          titleTextStyle: AppTextStyle.medium(
            size: 20,
            color: AppColors.white,
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            fixedSize: Size(double.infinity, 55.h),
            textStyle: AppTextStyle.medium(),
            side: BorderSide(color: AppColors.primary, width: 2.w),
            shape: RoundedRectangleBorder(borderRadius: _borderRadius),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: AppTextStyle.medium(size: 12.sp),
          ),
        ),

        // Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          prefixStyle: AppTextStyle.semiBold(size: 16),
          hintStyle: AppTextStyle.regular(size: 14, color: AppColors.grey),
          counterStyle: const TextStyle(fontSize: 0.0, height: 0.0),
          border: _setBorder(),
          errorBorder: _setBorder(color: AppColors.red),
          enabledBorder: _setBorder(),
          focusedBorder: _setBorder(),
          focusedErrorBorder: _setBorder(),
          disabledBorder: _setBorder(),
          fillColor: AppColors.inputColor,
          filled: false,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 17.w,
            vertical: 19.h,
          ),
        ),
      );

  static OutlineInputBorder _setBorder({Color color = Colors.transparent}) =>
      OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide(color: color),
      );

  static final BorderRadius _borderRadius = BorderRadius.circular(8.r);
}
