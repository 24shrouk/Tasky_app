import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            backgroundColor: MyColors.splachBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: MyFontStyle.font16Regular.copyWith(
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
