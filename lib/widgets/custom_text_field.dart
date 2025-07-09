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
  });

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

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
        hintText: hint,
        hintStyle: const TextStyle(color: MyColors.hintColor),
        border: buildBorder(),
        enabledBorder: buildBorder(MyColors.hintColor),
        focusedBorder: buildBorder(MyColors.hintColor),
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
