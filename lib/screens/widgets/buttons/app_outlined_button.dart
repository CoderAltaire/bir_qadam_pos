
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  bool isLoading;
  AppOutlinedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? const CupertinoActivityIndicator() : Text(label),
    );
  }
}
