import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.outSidePadding,
    required this.inSidePadding,
    this.alignment = Alignment.center,
    this.raduis = 10,
  });
  final void Function() onPressed;
  final String text;
  final EdgeInsetsGeometry outSidePadding;
  final EdgeInsetsGeometry inSidePadding;
  final AlignmentGeometry alignment;
  final double raduis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outSidePadding,
      child: Align(
        alignment: alignment,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: inSidePadding,
            backgroundColor: MyColors.splachBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis),
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
