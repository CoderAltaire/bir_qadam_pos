// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/core.dart';

class AppInputField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  Widget? prefixIcon;
  Widget? suffixIcon;
  List<TextInputFormatter>? formatters;
  TextInputType? keyboardType;
  bool readOnly;
  TextInputAction action;
  TextCapitalization capitalization;
  VoidCallback? onTap;
  int maxLines;
  bool? filled;
  bool? autfocus;
  Color? fillColor;
  FormFieldValidator<String>? validator;
  FocusNode? focusNode;
  TextStyle? errorStyle;

  AppInputField({
    super.key,
    this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.formatters,
    this.keyboardType,
    this.readOnly = false,
    this.action = TextInputAction.next,
    this.capitalization = TextCapitalization.words,
    this.onTap,
    this.maxLines = 1,
    this.validator,
    this.filled = true,
    this.fillColor,
    this.focusNode,
    this.errorStyle,
    this.autfocus=false,

  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // enabled: enabled,
      focusNode: focusNode,
      validator: validator,
      autofocus: autfocus??false,
      textInputAction: action,
      textCapitalization: capitalization,
      style: AppTextStyle.medium(size: 16),
      inputFormatters: formatters,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      decoration: InputDecoration(
          filled: filled,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: AppColors.dark, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.0),
          ),
          fillColor: fillColor,
          hintText: hint,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorStyle: errorStyle),
    );
  }
}
