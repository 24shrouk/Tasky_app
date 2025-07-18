import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

abstract class AppDialog {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Stack(
        alignment: Alignment.center,
        children: [
          const ModalBarrier(
            dismissible: false,
            color: Color.fromARGB(134, 249, 248, 248),
          ),
          const CircularProgressIndicator(),
        ],
      ),
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
