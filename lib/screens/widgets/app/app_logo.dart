import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/core.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.tiinLabel,
          height: 45.w,
        ),
        // _getLogo(),
        SizedBox(
          width: 7.h,
        ),
        Text(
          'Tiin Loyalty',
          style: AppTextStyle.bold(),
        )
      ],
    );
  }
}
