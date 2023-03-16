import 'package:flutter/material.dart';
import 'package:planner/utils/date.dart';

class CalendarWeekdayWidget extends StatefulWidget {
  final DateTime date;

  late final bool isLast;
  late final String dayName;
  late final String dayOfMonth;

  CalendarWeekdayWidget({super.key, required this.date}) {
    isLast = date.weekday == 7;
    dayName = getDayName(date);
    dayOfMonth = getDayOfMonth(date);
  }

  @override
  State<CalendarWeekdayWidget> createState() => _CalendarWeekdayWidgetState();
}

class _CalendarWeekdayWidgetState extends State<CalendarWeekdayWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(widget.dayName), Text(widget.dayOfMonth)],
                ),
                if (!widget.isLast) const Divider()
              ])),
    );
  }
}
