import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/home/ui/details_screen.dart';
import 'package:tasky_app/screens/home/widgets/flag_small_container.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class TaskContainerWidget extends StatefulWidget {
  const TaskContainerWidget({
    super.key,
    required this.taskModel,
    required this.onTap,
  });
  final TaskModel taskModel;
  final VoidCallback onTap;
  @override
  State<TaskContainerWidget> createState() => _TaskContainerWidgetState();
}

class _TaskContainerWidgetState extends State<TaskContainerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat(
      'EEE dd-MM-yyyy',
    ).format(widget.taskModel.dateTime);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailsTaskScreen(taskModel: widget.taskModel),
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
                GestureDetector(
                  onTap: widget.onTap,

                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: MyColors.splachBackground,
                        width: 2,
                      ),
                    ),
                    child: widget.taskModel.isCompeleted
                        ? Center(
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: MyColors.splachBackground,

                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        : null,
                  ),
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
                        formattedDate,
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
