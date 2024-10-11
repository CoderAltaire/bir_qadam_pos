import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter/material.dart';

class SixClientsAddButton extends StatelessWidget {
  const SixClientsAddButton({
    super.key,
    required this.color,
    required this.onPressed,
  });
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        focusNode: FocusNode(skipTraversal: true),
        color: color,
        minWidth: 90.h,
        height: 40.w,
        onPressed: onPressed,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 20.sp,
        ),
      ),
    );
  }
}
