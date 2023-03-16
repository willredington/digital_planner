import 'package:flutter/material.dart';
import 'package:planner/utils/date.dart';
import 'package:planner/widgets/week_day.dart';
import 'package:planner/widgets/week_header.dart';

class WeekWidget extends StatefulWidget {
  final DateTime now = DateTime.now();

  late final List<DateTime> dateRange;

  WeekWidget({super.key}) {
    dateRange = getWeekDateRange(now);
  }

  @override
  State<WeekWidget> createState() => _WeekWidgetState();
}

class _WeekWidgetState extends State<WeekWidget> {
  @override
  Widget build(BuildContext context) {
    final weekDayWidgets =
        widget.dateRange.map((date) => WeekdayWidget(date: date)).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const WeekHeaderWidget(title: "March", weekNumber: 11),
        ...weekDayWidgets
      ],
    );
  }
}
