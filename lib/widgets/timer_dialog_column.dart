import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasky_app/theming/my_colors.dart';
import 'package:intl/intl.dart';

class TimerAlertDialogWidget extends StatefulWidget {
  const TimerAlertDialogWidget({super.key});

  @override
  State<TimerAlertDialogWidget> createState() => _TimerAlertDialogWidgetState();
}

class _TimerAlertDialogWidgetState extends State<TimerAlertDialogWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          rowHeight: 40,
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) =>
                DateFormat.E(locale).format(date).toUpperCase(),
            weekdayStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            weekendStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),

          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          calendarStyle: CalendarStyle(
            tablePadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),

            todayDecoration: BoxDecoration(
              color: MyColors.splachBackground,
              borderRadius: BorderRadius.circular(6),
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(6),
            ),
            defaultDecoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            weekendDecoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            defaultTextStyle: TextStyle(color: MyColors.whiteColor),
            weekendTextStyle: TextStyle(color: MyColors.whiteColor),
            selectedTextStyle: TextStyle(color: MyColors.whiteColor),
            todayTextStyle: TextStyle(color: MyColors.whiteColor),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
          ),

          calendarBuilders: CalendarBuilders(
            headerTitleBuilder: (context, day) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_monthName(day.month)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyColors.grayBigTextColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${day.year}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: MyColors.hintColor,
                    ),
                  ),
                  Divider(color: MyColors.grayBigTextColor, height: 20),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, _selectedDay);
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: MyColors.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
