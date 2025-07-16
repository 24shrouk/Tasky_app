import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

abstract class AppDialog {
  static void showLoading() {
    Stack(
      children: [
        ModalBarrier(dismissible: false, color: MyColors.hintColor),
        CircularProgressIndicator(
          color: MyColors.splachBackground,
          strokeWidth: 4,
        ),
      ],
    );
  }

  static void showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Title Error ",
          style: MyFontStyle.font16Bold.copyWith(color: MyColors.redColor),
        ),
        content: Text(
          error,
          style: MyFontStyle.font16Regular.copyWith(
            color: MyColors.grayBigTextColor,
          ),
        ),
      ),
    );
  }
}
