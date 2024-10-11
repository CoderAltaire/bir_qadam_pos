import 'package:flutter/material.dart';
import '../../../core/core.dart';

// ignore: must_be_immutable
class AppTitle extends StatelessWidget {
  final String title;
  double size;
  AppTitle({super.key, required this.title, this.size = 27});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.semiBold(size: size),
    );
  }
}
