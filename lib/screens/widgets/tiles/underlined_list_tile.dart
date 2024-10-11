import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/core.dart';

// ignore: must_be_immutable
class UnderlinedListTile extends StatelessWidget {
  final String title;
  bool isSelected;
  VoidCallback? onTap;
  double fontSize;
  UnderlinedListTile({
    Key? key,
    required this.title,
    this.isSelected = false,
    this.onTap,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              title,
              style: AppTextStyle.medium(size: fontSize),
            ).wrapExpanded(),
            Visibility(
              visible: isSelected,
              child: SvgPicture.asset(AppIcons.tick),
            )
          ],
        ).onClick(onTap),
        SizedBox(height: 12.h),
        Divider(height: 1.h, thickness: 1.h),
      ],
    );
  }
}
