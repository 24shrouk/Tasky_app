abstract class SelectedDayFunctions {
  static DateTime getTargetDate(String label, DateTime now) {
    switch (label) {
      case 'Today':
        return DateTime(now.year, now.month, now.day);
      case 'Tomorrow':
        final temp = now.add(Duration(days: 1));
        return DateTime(temp.year, temp.month, temp.day);
      case 'Next Week':
        final temp = now.add(Duration(days: 7));
        return DateTime(temp.year, temp.month, temp.day);
      default:
        return DateTime(now.year, now.month, now.day);
    }
  }

  static List<DateTime> getWeekendDates(DateTime now) {
    final friday = now.add(Duration(days: (5 - now.weekday) % 7));
    final saturday = now.add(Duration(days: (6 - now.weekday) % 7));
    return [
      DateTime(friday.year, friday.month, friday.day),
      DateTime(saturday.year, saturday.month, saturday.day),
    ];
  }

  static List<DateTime> getNextWeekDates(DateTime now) {
    final int daysUntilSaturday = (DateTime.saturday - now.weekday + 7) % 7;
    final nextSaturday = now.add(Duration(days: daysUntilSaturday));

    return List.generate(7, (index) {
      final day = nextSaturday.add(Duration(days: index));
      return DateTime(day.year, day.month, day.day);
    });
  }
}
