

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class AppIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  Color? iconColor;
  double iconSize;
  AppIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        // ignore: deprecated_member_use
        color: iconColor,
        height: iconSize.h,
        width: iconSize.w,
      ),
    );
  }
}
