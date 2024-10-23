import 'package:flutter/material.dart';
import '../../../core/core.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool enableColor;
  final bool loading;
  final VoidCallback? onPressed;
  const PrimaryButton({
    super.key,
    required this.label,
    this.loading = false,
    this.enableColor = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          backgroundColor: enableColor ? AppColors.primary : AppColors.greyF5,
        ),
        onPressed: onPressed,
        child: !loading
            ? Text(
                label,
                style: AppTextStyle.semiBold(
                  size: 16,
                  color: enableColor ? AppColors.white : AppColors.dark,
                ),
              )
            : CircularProgressIndicator(
                color: enableColor ? AppColors.white : AppColors.dark,
                strokeWidth: 1,
              ),
      ),
    );
  }
}
