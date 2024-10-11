

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// ignore: must_be_immutable
class CircularButton extends StatelessWidget {
  final String assetIcon;
  final VoidCallback? onPressed;
  bool isLoading;
  double size;
  double iconSize;
  Color? color;

  CircularButton({
    Key? key,
    required this.assetIcon,
    required this.onPressed,
    this.size = 62,
    this.isLoading = false,
    this.color,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
      width: size.w,
      child: FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: color,
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CupertinoActivityIndicator(color: AppColors.white)
            : SvgPicture.asset(
                assetIcon,
                height: iconSize.h,
                width: iconSize.w,
              ),
      ),
    );
  }
}
