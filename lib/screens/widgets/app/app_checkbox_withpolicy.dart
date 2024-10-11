import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/core.dart';

class AppCheckBoxListTilePolicy extends StatelessWidget {
  final VoidCallback onTap;
  final bool isAgree;
  final RichText title;
  const AppCheckBoxListTilePolicy({
    Key? key,
    required this.onTap,
    required this.isAgree,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                color: isAgree ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Icon(
                isAgree ? Icons.check : Icons.check_box_outline_blank,
                size: 20.w,
                color: Colors.white,
              )),
          SizedBox(width: 20.w),
          Expanded(child: title)
        ],
      ),
    );
  }
}
