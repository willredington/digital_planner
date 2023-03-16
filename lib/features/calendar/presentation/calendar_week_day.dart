import 'package:flutter/material.dart';
import 'package:planner/utils/date.dart';

class CalendarWeekdayWidget extends StatefulWidget {
  final DateTime date;
  final bool isActive;
  final Function onClick;

  late final bool isLast;
  late final String dayName;
  late final String dayOfMonth;

  CalendarWeekdayWidget(
      {super.key,
      required this.date,
      required this.isActive,
      required this.onClick}) {
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
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => widget.onClick(),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.dayName,
                    ),
                    Text(
                      widget.dayOfMonth,
                      textScaleFactor: widget.isActive ? 2 : 1.25,
                    )
                  ],
                ),
                if (!widget.isLast) const Divider()
              ]),
        ),
      ),
    );
  }
}