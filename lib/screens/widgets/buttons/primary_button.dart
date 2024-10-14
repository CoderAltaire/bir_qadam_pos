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
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: enableColor
            ? WidgetStateProperty.all(AppColors.primary)
            : WidgetStateProperty.all(AppColors.greyF5),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        )),
      ),
      onPressed: onPressed,
      child: !loading
          ? Text(
              label,
              style: AppTextStyle.medium(
                color: enableColor ? AppColors.white : AppColors.dark,
              ),
            )
          : CircularProgressIndicator(
              color: enableColor ? AppColors.white : AppColors.dark,
              strokeWidth: 1,
            ),
    );
  }
}
