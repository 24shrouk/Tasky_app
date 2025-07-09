import 'package:flutter/material.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:tasky_app/theming/my_fonts.dart';

class FlagWidget extends StatefulWidget {
  const FlagWidget({super.key});

  @override
  State<FlagWidget> createState() => _FlagWidgetState();
}

class _FlagWidgetState extends State<FlagWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          Text(
            "Task Priority",
            style: MyFontStyle.font16Bold.copyWith(
              color: MyColors.grayBigTextColor,
            ),
          ),
          Divider(color: MyColors.grayBigTextColor,),
          Row(children: [],),
          Row(children: [],),
          Row(children: [],),

        ],
      ),
    );
  }
}
