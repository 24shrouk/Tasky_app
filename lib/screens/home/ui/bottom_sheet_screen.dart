import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasky_app/screens/home/widgets/time_and_poriority_widget.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';
import 'package:tasky_app/widgets/custom_text_field.dart';
import 'package:tasky_app/screens/home/widgets/row_of_bottom_sheet_icons_widget.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({
    super.key,
    required this.taskController,
    required this.descriptionController,
    this.onTapFlag,
    this.onTapTimer,
    this.onTapSend,
    required this.priority,
    required this.selectedDate,
  });

  final TextEditingController taskController;
  final TextEditingController descriptionController;
  final void Function()? onTapFlag;
  final void Function()? onTapTimer;
  final void Function()? onTapSend;
  final int priority;
  final DateTime selectedDate;

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    DateTime date = widget.selectedDate;
    String formattedDate = DateFormat('EEE dd-MM-yyyy').format(date);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Task",
              style: MyFontStyle.font20Bold.copyWith(
                color: MyColors.grayBigTextColor,
              ),
            ),
            SizedBox(height: 12),
            CustomTextFormFeild(
              hint: "Do math homework",
              enabledBorderColor: MyColors.hintColor,
              focusedBorderColor: MyColors.hintColor,
              controller: widget.taskController,
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormFeild(
                    hint: "Description",
                    focusedBorderColor: MyColors.hintColor,
                    controller: widget.descriptionController,
                  ),
                ),
                RowOfTimeAndPoriorityWidget(
                  priority: widget.priority,
                  time: formattedDate,
                ),
              ],
            ),

            RowOfBottomSheetIconsWidget(
              onTapFlag: widget.onTapFlag,
              onTapTimer: widget.onTapTimer,
              onTapSend: widget.onTapSend,
            ),
          ],
        ),
      ),
    );
  }
}
