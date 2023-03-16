import 'package:flutter/material.dart';
import 'package:planner/features/calendar/model/calendar_view_mode.dart';
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

  CalendarViewMode _viewMode = CalendarViewMode.week;

  late DateTime _activeDate;

  late final List<DateTime> _dateRange;

  _onViewModeChange(CalendarViewMode mode) {
    setState(() {
      _viewMode = mode;
    });
  }

  _onDayChange(DateTime day) {
    setState(() {
      _activeDate = day;
    });
  }

  @override
  void initState() {
    _dateRange = getWeekDateRange(_now);
    _activeDate = _now;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_activeDate);
    final weekDayWidgets = _dateRange
        .map((date) => CalendarWeekdayWidget(
              date: date,
              onClick: () => _onDayChange(date),
              isActive: date.compareTo(_activeDate) == 0,
            ))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [CalendarWeekHeaderWidget(date: _now), ...weekDayWidgets],
    );
  }
}
