import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_click/on_click.dart';
import '../../../core/core.dart';

// ignore: must_be_immutable
class AppRadioTile extends StatelessWidget {
  final String group;
  final String title;
  final VoidCallback onTap;

  const AppRadioTile({
    super.key,
    required this.group,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: AppShapes.withBorder(radius: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.medium(size: 18),
          ),
          Container(
            height: 24.h,
            width: 24.w,
            decoration: BoxDecoration(
              color: AppColors.greyEf,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                width: _isActive ? 4.w : 2.w,
                color: _isActive ? AppColors.primary : AppColors.greyEf,
              ),
            ),
          ),
        ],
      ),
    ).onClick(onTap);
  }

  bool get _isActive => group == title;
}
