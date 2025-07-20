import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasky_app/core/utils/my_colors.dart';
import 'package:intl/intl.dart';
import 'package:tasky_app/core/utils/my_fonts.dart';

class TimerAlertDialogWidget extends StatefulWidget {
  const TimerAlertDialogWidget({super.key, required this.onSave});
  final Function(DateTime selectedDay) onSave;

  @override
  State<TimerAlertDialogWidget> createState() => _TimerAlertDialogWidgetState();
}

class _TimerAlertDialogWidgetState extends State<TimerAlertDialogWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          rowHeight: 35,
          daysOfWeekHeight: 25,
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) =>
                DateFormat.E(locale).format(date).toUpperCase(),
            weekdayStyle: MyFontStyle.font10Bold.copyWith(
              color: MyColors.blackTextColor,
            ),
            weekendStyle: MyFontStyle.font10Bold.copyWith(
              color: MyColors.redColor,
            ),
          ),

          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              widget.onSave(_selectedDay!);
            });
          },

          calendarStyle: CalendarStyle(
            cellMargin: EdgeInsets.all(5),
            todayDecoration: BoxDecoration(
              color: MyColors.splachBackground,
              borderRadius: BorderRadius.circular(6),
            ),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: MyColors.splachBackground,
                  spreadRadius: 0.5,
                  blurRadius: 6,
                  offset: Offset(2, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            defaultDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            weekendDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            outsideDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6),
              color: MyColors.whiteColor,
            ),
            outsideTextStyle: TextStyle(color: Colors.grey),
            defaultTextStyle: TextStyle(color: MyColors.whiteColor),
            weekendTextStyle: TextStyle(color: MyColors.whiteColor),
            selectedTextStyle: TextStyle(color: MyColors.blackTextColor),
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
                    _monthName(day.month).toUpperCase(),
                    style: MyFontStyle.font14Regular.copyWith(
                      color: MyColors.floatActionButtonColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${day.year}',
                    style: MyFontStyle.font10Regular.copyWith(
                      color: MyColors.floatActionButtonColor,
                    ),
                  ),
                  Divider(color: MyColors.grayBigTextColor, height: 20),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
