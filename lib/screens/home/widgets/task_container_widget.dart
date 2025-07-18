import 'package:flutter/material.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/home/ui/details_screen.dart';
import 'package:tasky_app/screens/home/widgets/flag_small_container.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class TaskContainerWidget extends StatefulWidget {
  const TaskContainerWidget({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<TaskContainerWidget> createState() => _TaskContainerWidgetState();
}

class _TaskContainerWidgetState extends State<TaskContainerWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(taskModel: widget.taskModel),
          ),
        );
      },
      child: Container(
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
                        widget.taskModel.title,
                        style: MyFontStyle.font16Regular.copyWith(
                          color: MyColors.floatActionButtonColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.taskModel.dateTime.toString(),
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
            Positioned(
              bottom: 0,
              right: 0,
              child: FlagSmallContainerWidget(
                priority: widget.taskModel.periority,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
