import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExt on Widget {
  Expanded wrapExpanded({int flex = 1}) => Expanded(flex: flex, child: this);

  // Container wrapContainer() => Container(
  //       padding: EdgeInsets.all(4.sp),
  //       decoration: AppShapes.withBorder(borderColor: AppColors.GREY_F1),
  //       child: this,
  //     );

  Visibility visibility({bool visible = true}) => Visibility(
        visible: visible,
        child: this,
      );

  Padding symmetricPadding({double h = 25, double v = 0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: h.w, vertical: v.h),
        child: this,
      );

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);

  Align toAlign({Alignment alignment = Alignment.center}) => Align(
        alignment: alignment,
        child: this,
      );
}