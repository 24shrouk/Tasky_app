import 'package:flutter/material.dart';
import 'package:tasky_app/core/app_ontap_functions.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/firebase/firebase_database.dart';
import 'package:tasky_app/screens/home/ui/bottom_sheet_screen.dart';
import 'package:tasky_app/screens/home/widgets/selected_day_functions.dart';

class TaskFunctions {
  static void updateFilter({
    required String newOption,
    required DateTime now,
    required List<TaskModel> tasks,
    required Function(List<TaskModel>) updateFilteredTasks,
    required Function(String) updateSelectedLabel,
  }) {
    updateSelectedLabel(newOption);

    List<TaskModel> filtered;
    if (newOption == 'This Weekend') {
      final weekendDates = SelectedDayFunctions.getWeekendDates(now);
      filtered = tasks.where((task) {
        final taskDate = DateTime(
          task.dateTime.year,
          task.dateTime.month,
          task.dateTime.day,
        );
        return weekendDates.any((date) => date == taskDate);
      }).toList();
    } else if (newOption == 'Next Week') {
      final nextWeekDates = SelectedDayFunctions.getNextWeekDates(now);
      filtered = tasks.where((task) {
        final taskDate = DateTime(
          task.dateTime.year,
          task.dateTime.month,
          task.dateTime.day,
        );
        return nextWeekDates.contains(taskDate);
      }).toList();
    } else {
      final targetDate = SelectedDayFunctions.getTargetDate(newOption, now);
      filtered = tasks.where((task) {
        final taskDate = DateTime(
          task.dateTime.year,
          task.dateTime.month,
          task.dateTime.day,
        );
        return taskDate == targetDate;
      }).toList();
    }

    updateFilteredTasks(filtered);
  }

  static void showAddTaskBottomSheet({
    required BuildContext context,
    // required int priority,
    // required bool isSelected,
    required TextEditingController taskController,
    required TextEditingController descriptionController,
    // required DateTime selectedDate,
    required TaskModel taskModel,
    required Function(int) updatePriority,
    required Function(DateTime) updateSelectedDate,
    required Future<void> Function() getTasks,
  }) {
    showModalBottomSheet(
      backgroundColor: MyColors.whiteColor,
      isScrollControlled: true,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      context: context,
      builder: (context) {
        return BottomSheetScreen(
          selectedDate: taskModel.dateTime,
          priority: taskModel.periority,
          onTapFlag: () {
            AppFunctions.onTapFlag(context, updatePriority);
          },
          onTapTimer: () {
            AppFunctions.onTapTimer(context, updateSelectedDate);
          },
          onTapSend: () {
            AppFunctions.onTapSend(
              isCompeleted: taskModel.isCompeleted,
              context: context,
              taskController: taskController,
              descriptionController: descriptionController,
              priority: taskModel.periority,
              updatePriority: updatePriority,
              selectedDate: taskModel.dateTime,
              updateSelectedDate: updateSelectedDate,
              getTasks: getTasks,
            );
          },
          taskController: taskController,
          descriptionController: descriptionController,
        );
      },
    );
  }

  static Future<List<TaskModel>> charactersSearch(String value) async {
    final tasks = await FireBaseDatabase.getAllTask();
    return tasks
        .where(
          (task) => task.title.toLowerCase().startsWith(value.toLowerCase()),
        )
        .toList();
  }

  static Future<Map<String, List<TaskModel>>> getTasksFiltered({
    required String selectedLabel,
    required DateTime now,
    required BuildContext context,
  }) async {
    try {
      final tasks = await FireBaseDatabase.getAllTask();
      final targetDate = SelectedDayFunctions.getTargetDate(selectedLabel, now);

      final filtered = tasks.where((task) {
        final taskDate = DateTime(
          task.dateTime.year,
          task.dateTime.month,
          task.dateTime.day,
        );
        return taskDate == targetDate;
      }).toList();

      final completed = tasks.where((task) => task.isCompeleted).toList();

      return {
        'tasks': tasks,
        'filteredTasks': filtered,
        'completedTasks': completed,
      };
    } catch (error) {
      AppDialog.showErrorDialog(context, "Error: $error");
      return {'tasks': [], 'filteredTasks': [], 'completedTasks': []};
    }
  }
}
