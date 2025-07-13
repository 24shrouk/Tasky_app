import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
  });

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Feild is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,

      cursorColor: MyColors.graySmallTextColor,
      decoration: InputDecoration(
        // contentPadding: EdgeInsetsGeometry.all(12),
        hintText: hint,
        hintStyle: const TextStyle(color: MyColors.hintColor),
        border: buildBorder(),
        enabledBorder: buildBorder(MyColors.hintColor),
        focusedBorder: buildBorder(MyColors.hintColor),
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
