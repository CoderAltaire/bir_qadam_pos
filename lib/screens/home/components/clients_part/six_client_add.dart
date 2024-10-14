import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter/material.dart';

class SixClientsAddButton extends StatelessWidget {
  const SixClientsAddButton({
    super.key,
    required this.color,
    required this.onPressed,
  });
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed,
      child: Padding(
        padding: EdgeInsets.only(left: 0.sp),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.07),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
            child: Text(
              "+ Qo’shish",
              style: AppTextStyle.regular(color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
