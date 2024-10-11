import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';

class AppShapes {
  const AppShapes._();
  static RoundedRectangleBorder simple({double radius = 12.0}) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r));

  // static BoxDecoration withBorderImage({
  //   required String imageUrl,
  //   double radius = 8,
  //   Color? borderColor,
  //   Color? color,
  //   double width = 2,
  // }) =>
  //     BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(radius.r),
  //       image: DecorationImage(image: AppImageProvider(imageUrl)),
  //       border: Border.all(
  //         width: width.w,
  //         color: borderColor ?? AppColors.greyEf,
  //       ),
  //     );

  static BoxDecoration withBorder({
    double radius = 8,
    Color? borderColor,
    Color? color,
    double width = 1.2,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
        border: Border.all(
          width: width.w,
          color: borderColor ?? AppColors.greyEf,
        ),
      );

  // static BoxDecoration withImage(
  //   String imageUrl, {
  //   Color? color,
  //   double radius = 8,
  // }) =>
  //     BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(radius.r),
  //       image: DecorationImage(
  //         fit: BoxFit.cover,
  //         image: AppImageProvider(imageUrl),
  //       ),
  //     );

  static BoxDecoration circular({
    double radius = 8,
    Color? color,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
      );

  static BoxDecoration cardStyle({
    double radius = 8,
    Color? color,
  }) =>
      BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            blurRadius: 2.r,
            spreadRadius: 0.5.r,
            color: AppColors.greyEf,
            offset: Offset(0, 1.h),
          )
        ],
        borderRadius: BorderRadius.circular(radius.r),
      );

  static BoxDecoration bottomBarStyle({
    double radius = 8,
    Color? color,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      );
}
