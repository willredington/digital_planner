import 'package:flutter/material.dart';
import 'package:planner/utils/date.dart';

import 'calendar_week_day.dart';
import 'calendar_week_header.dart';

class CalendarWeekWidget extends StatefulWidget {
  final DateTime now = DateTime.now();

  late final List<DateTime> dateRange;

  CalendarWeekWidget({super.key}) {
    dateRange = getWeekDateRange(now);
  }

  @override
  State<CalendarWeekWidget> createState() => _CalendarWeekWidgetState();
}

class _CalendarWeekWidgetState extends State<CalendarWeekWidget> {
  @override
  Widget build(BuildContext context) {
    final weekDayWidgets = widget.dateRange
        .map((date) => CalendarWeekdayWidget(date: date))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [CalendarWeekHeaderWidget(date: widget.now), ...weekDayWidgets],
    );
  }
}
