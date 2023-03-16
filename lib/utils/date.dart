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
