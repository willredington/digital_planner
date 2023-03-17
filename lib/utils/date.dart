import 'package:intl/intl.dart';

List<DateTime> getWeekDateRange(DateTime now) {
  final dayIndex = now.weekday;

  final List<DateTime> dateRange = [];

  DateTime currentDay = now;

  // if its not a Monday, make it so
  if (currentDay.weekday > 1) {
    currentDay = currentDay.subtract(Duration(days: dayIndex - 1));
  }

  for (var i = 1; i < 8; i++) {
    dateRange.add(currentDay);
    currentDay = currentDay.add(const Duration(days: 1));
  }

  return dateRange;
}

String getDayName(DateTime date) {
  return DateFormat('EEEE').format(date);
}

String getDayOfMonth(DateTime date) {
  return DateFormat('d').format(date);
}

String getDayMonth(DateTime date) {
  return DateFormat('EEEE, MMMM d').format(date);
}

String getMonthName(DateTime date) {
  return DateFormat('MMMM').format(date);
}

int getWeekOfYear(DateTime date) {
  final dayOfYear = DateFormat('D').format(date);
  return (int.parse(dayOfYear) / 7).round();
}
