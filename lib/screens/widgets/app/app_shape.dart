import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/core.dart';

class AppShape {
  static circularBorder({double radius = 8.0}) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      );

  static simple({double radius = 10, Color color = AppColors.lightGreen}) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
      );

  static simpleContainer() => BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(
        color: AppColors.dark,
        width: 1,
      ));

  static simpleContainer2({double radius = 10, Color color = AppColors.dark}) =>
      BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(
            color: color,
            width: 1,
          ));

  // static withImage({
  //   String? image,
  //   double radius = 10,
  //   Color color = AppColors.lightGreen,
  // }) =>
  //     BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(radius.r),
  //       image: image != null
  //           ? DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))
  //           : const DecorationImage(
  //               fit: BoxFit.cover,
  //               image: AssetImage(AppImages.),
  //             ),
  //     );

  static cardDesign({
    double radius = 10,
    Color color = AppColors.lightGreen,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
        boxShadow: [
          BoxShadow(blurRadius: 3.r, color: AppColors.darkGrey.withOpacity(.5)),
          // BoxShadow(blurRadius: 5.r, color: AppColors.grey),
        ],
      );
}
