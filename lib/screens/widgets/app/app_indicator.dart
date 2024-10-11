import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/core.dart';

// ignore: must_be_immutable
class AppInidcator extends StatelessWidget {
  final int count;
  final int currentPage;
  Color? activeColor;
  Color? inActiveColor;
  AppInidcator({
    Key? key,
    required this.count,
    required this.currentPage,
    this.activeColor,
    this.inActiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4.w,
      children: List.generate(
        count,
        (index) => _setIndicator(index),
      ),
    );
  }

  AnimatedContainer _setIndicator(int index) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 4.w,
        height: (currentPage == index ? 12 : 4).h,
        decoration: BoxDecoration(
          color: currentPage == index
              ? activeColor ?? _getColor
              : inActiveColor ?? _getColor.withOpacity(0.36),
          borderRadius: BorderRadius.circular(4.r),
        ),
      );

  // ignore: unrelated_type_equality_checks
  Color get _getColor => AppColors.dark;
}
