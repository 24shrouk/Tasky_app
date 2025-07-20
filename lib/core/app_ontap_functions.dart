import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/firebase/firebase_database.dart';
import 'package:tasky_app/screens/home/widgets/flag_widget.dart';
import 'package:tasky_app/screens/home/widgets/timer_dialog_column.dart';
import 'package:tasky_app/widgets/custom_button_widget.dart';

class AppFunctions {
  static onTapFlag(BuildContext context, Function(int) onSelectedPriority) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FlagWidget(
          onPressed: (index) {
            onSelectedPriority(index);
            log("Selected Priority: $index");
            Navigator.pop(context);
          },
        );
      },
    );
  }

  static Future<void> onTapSend({
    required BuildContext context,
    required TextEditingController taskController,
    required TextEditingController descriptionController,
    required int priority,
    required Function(int) updatePriority,
    required DateTime selectedDate,
    required Function(DateTime) updateSelectedDate,
    required Future<void> Function() getTasks,
    required bool isCompeleted,
  }) async {
    AppDialog.showLoading(context);

    try {
      await FireBaseDatabase.createTask(
        isCompeleted: isCompeleted,
        title: taskController.text,
        description: descriptionController.text,
        periority: priority,
        dateTime: selectedDate,
      );
      log(priority.toString());
      log("Selected Date: ${selectedDate.toString()}");
      Navigator.pop(context);
      taskController.clear();
      descriptionController.clear();
      updatePriority(priority);
      updateSelectedDate(selectedDate);
      Navigator.pop(context);
      await getTasks();
    } catch (error) {
      AppDialog.showErrorDialog(context, "Error: $error");
      Navigator.pop(context);
      taskController.clear();
      descriptionController.clear();
      Navigator.pop(context);
    }
  }

  static onTapTimer(BuildContext context, Function(DateTime) onSelectedDay) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime? selectedTime;
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 350,
            child: TimerAlertDialogWidget(
              onSave: (time) {
                selectedTime = time;
              },
            ),
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
                      log(selectedTime.toString());
                      onSelectedDay(selectedTime ?? DateTime.now());
                      log("Selected Date: ${selectedTime.toString()}");
                      Navigator.pop(context);
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
      },
    );
  }
}
