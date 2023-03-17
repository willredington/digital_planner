import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planner/utils/date.dart';

import 'calendar_week_day.dart';
import 'calendar_week_header.dart';

class CalendarWeekWidget extends StatefulWidget {
  const CalendarWeekWidget({super.key});

  @override
  State<CalendarWeekWidget> createState() => _CalendarWeekWidgetState();
}

class _CalendarWeekWidgetState extends State<CalendarWeekWidget> {
  final DateTime _now = DateTime.now();

  late final List<DateTime> _dateRange;

  @override
  void initState() {
    _dateRange = getWeekDateRange(_now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weekDayWidgets = _dateRange
        .map((date) => CalendarWeekdayWidget(
              date: date,
              isActive: date.compareTo(_now) == 0,
              onClick: () => context.go("/calendar/${date.toString()}"),
            ))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [CalendarWeekHeaderWidget(date: _now), ...weekDayWidgets],
    );
  }
}
