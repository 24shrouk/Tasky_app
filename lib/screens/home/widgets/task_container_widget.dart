import 'package:flutter/material.dart';
import 'package:tasky_app/screens/home/widgets/flag_small_container.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class TaskContainerWidget extends StatefulWidget {
  const TaskContainerWidget({super.key});

  @override
  State<TaskContainerWidget> createState() => _TaskContainerWidgetState();
}

class _TaskContainerWidgetState extends State<TaskContainerWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 3),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        border: Border.all(color: MyColors.hintColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio<bool>(
                value: true,
                groupValue: isSelected,
                activeColor: MyColors.floatActionButtonColor,
                onChanged: (value) {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                fillColor: WidgetStatePropertyAll(MyColors.splachBackground),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Do Math Homework",
                      style: MyFontStyle.font16Regular.copyWith(
                        color: MyColors.floatActionButtonColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Today At 16:45",
                      style: MyFontStyle.font14Regular.copyWith(
                        color: MyColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          Positioned(bottom: 0, right: 0, child: FlagSmallContainerWidget()),
        ],
      ),
    );
  }
}
