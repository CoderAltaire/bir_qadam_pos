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
            : WidgetStateProperty.all(AppColors.greyF4.withOpacity(0.5)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        )),
      ),
      onPressed: onPressed,
      child: !loading
          ? Text(
              label,
              style: AppTextStyle.medium(color: AppColors.white),
            )
          : const CircularProgressIndicator(
              color: AppColors.white,
              strokeWidth: 1,
            ),
    );
  }
}
