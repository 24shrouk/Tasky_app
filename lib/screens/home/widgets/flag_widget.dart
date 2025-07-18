import 'package:flutter/material.dart';
import 'package:tasky_app/screens/home/widgets/flag_container_widget.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

import 'package:tasky_app/widgets/custom_button_widget.dart';

class FlagWidget extends StatefulWidget {
  const FlagWidget({super.key, required this.onPressed});
  final void Function(int) onPressed;
  @override
  State<FlagWidget> createState() => _FlagWidgetState();
}

class _FlagWidgetState extends State<FlagWidget> {
  List<int> index = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int selectedIndex = 1;
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
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: index
                .map(
                  (index) => FlagContainer(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    isSelected: selectedIndex == index,
                    number: index,
                  ),
                )
                .toList(),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.deepPurple),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  widget.onPressed(selectedIndex);
                },
                raduis: 4,
                text: "Save",
                outSidePadding: EdgeInsetsGeometry.only(right: 4),
                inSidePadding: EdgeInsetsGeometry.symmetric(
                  vertical: 8,
                  horizontal: 40,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
