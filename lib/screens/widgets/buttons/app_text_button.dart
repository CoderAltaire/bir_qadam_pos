

import 'package:flutter/material.dart';
import '../../../core/core.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: AppTextStyle.regular(color: AppColors.primary)),
    );
  }
}
