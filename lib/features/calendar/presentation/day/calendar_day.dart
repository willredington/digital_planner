import 'package:flutter/material.dart';
import 'package:planner/common/notebook_lines.dart';
import 'package:planner/utils/date.dart';

class CalendarDayWidget extends StatefulWidget {
  late final DateTime date;

  CalendarDayWidget({super.key, required String dateStr}) {
    date = DateTime.parse(dateStr);
  }

  @override
  State<CalendarDayWidget> createState() => _CalendarDayWidgetState();
}

class _CalendarDayWidgetState extends State<CalendarDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          foregroundPainter: NotebookLinesWidget(),
          child: Container(
            constraints: const BoxConstraints.expand(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Column(children: [
            Text(
              getDayMonth(widget.date),
              textScaleFactor: 1.75,
              style: TextStyle(color: Colors.grey.shade700),
            )
          ]),
        )
      ],
    );
  }
}
