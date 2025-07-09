import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';

class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });
  final String text1;
  final String text2;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: MyFontStyle.font14Regular.copyWith(
          color: MyColors.blackTextColor,
        ),
        children: [
          TextSpan(
            text: text2,
            style: MyFontStyle.font14Regular.copyWith(
              color: MyColors.splachBackground,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap =
                  onTap, //هنا .. => اسمه  Cascade Operator وده معنه ان بعد ما ينشى
            //object من TapGestureRecognizer هينفذ الحاجة اللي في on tap
          ),
        ],
      ),
    );
  }
}
