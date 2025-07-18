import 'package:flutter/material.dart';
import 'package:tasky_app/screens/home/widgets/flag_small_container.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class RowOfTimeAndPoriorityWidget extends StatefulWidget {
  const RowOfTimeAndPoriorityWidget({super.key});

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
            "Today",
            style: MyFontStyle.font14Regular.copyWith(
              color: MyColors.greyTextColor,
            ),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(5),
        //   decoration: BoxDecoration(
        //     border: Border.all(color: MyColors.splachBackground),
        //     borderRadius: BorderRadius.circular(4),
        //     color: MyColors.whiteColor,
        //   ),
        //   child: ,
        // ),
        FlagSmallContainerWidget(),
      ],
    );
  }
}
