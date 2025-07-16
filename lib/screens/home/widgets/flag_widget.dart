import 'package:flutter/material.dart';
import 'package:tasky_app/screens/home/widgets/flag_container_widget.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/widgets/cancel_and_save_buttons_widget.dart';

class FlagWidget extends StatefulWidget {
  const FlagWidget({super.key});

  @override
  State<FlagWidget> createState() => _FlagWidgetState();
}

class _FlagWidgetState extends State<FlagWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.whiteColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Text(
            "Task Priority",
            style: MyFontStyle.font16Bold.copyWith(
              color: MyColors.grayBigTextColor,
            ),
          ),
          Divider(color: MyColors.grayBigTextColor),
          SizedBox(height: 22),
          Row(
            spacing: 25,
            children: [
              FlagContainer(isSelected: true, number: 1),
              FlagContainer(isSelected: false, number: 2),
              FlagContainer(isSelected: false, number: 3),
            ],
          ),
          SizedBox(height: 12),
          Row(
            spacing: 25,
            children: [
              FlagContainer(isSelected: false, number: 4),
              FlagContainer(isSelected: false, number: 5),
              FlagContainer(isSelected: false, number: 6),
            ],
          ),
          SizedBox(height: 12),
          Row(
            spacing: 25,
            children: [
              FlagContainer(isSelected: false, number: 7),
              FlagContainer(isSelected: false, number: 8),
              FlagContainer(isSelected: false, number: 9),
            ],
          ),
          SizedBox(height: 12),
          Row(
            spacing: 25,
            children: [FlagContainer(isSelected: false, number: 10)],
          ),
          SizedBox(height: 28),
          CancelAndSaveButtonsWidget(),
        ],
      ),
    );
  }
}
