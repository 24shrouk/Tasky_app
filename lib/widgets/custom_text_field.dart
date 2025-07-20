import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/my_colors.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild({
    super.key,
    this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.obscurText = false,
    this.controller,
    this.validator,
    this.hintStyle,
  });

  final String? hint;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  bool obscurText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      minLines: 1,
      obscureText: obscurText,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,

      cursorColor: MyColors.graySmallTextColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? const TextStyle(color: MyColors.hintColor),
        border: buildBorder(),
        enabledBorder: buildBorder(enabledBorderColor),
        focusedBorder: buildBorder(focusedBorderColor),
        errorBorder: buildBorder(MyColors.redColor),
        focusedErrorBorder: buildBorder(MyColors.redColor),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
