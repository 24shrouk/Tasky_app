import 'package:flutter/material.dart';
import 'package:tasky_app/screens/home/widgets/flag_small_container.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class RowOfTimeAndPoriorityWidget extends StatefulWidget {
  const RowOfTimeAndPoriorityWidget({
    super.key,
    required this.priority,
    required this.time,
  });
  final int priority;
  final String time;
  @override
  State<RowOfTimeAndPoriorityWidget> createState() =>
      _RowOfTimeAndPoriorityWidgetState();
}

class _RowOfTimeAndPoriorityWidgetState
    extends State<RowOfTimeAndPoriorityWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: MyColors.dayContainerColor,
          ),
          child: Text(
            widget.time,
            style: MyFontStyle.font14Regular.copyWith(
              color: MyColors.greyTextColor,
            ),
          ),
        ),

        FlagSmallContainerWidget(priority: widget.priority),
      ],
    );
  }
}
