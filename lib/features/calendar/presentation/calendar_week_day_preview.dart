import 'package:flutter/material.dart';

class CalendarWeekdayPreviewWidget extends StatefulWidget {
  const CalendarWeekdayPreviewWidget({super.key});

  @override
  State<CalendarWeekdayPreviewWidget> createState() =>
      _CalendarWeekdayPreviewWidgetState();
}

class _CalendarWeekdayPreviewWidgetState
    extends State<CalendarWeekdayPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple,
        child: const Text(
            overflow: TextOverflow.ellipsis, "preview content goes here"));
  }
}
