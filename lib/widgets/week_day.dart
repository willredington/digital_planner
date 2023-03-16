import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekdayWidget extends StatefulWidget {
  final DateTime date;

  late final bool isLast;
  late final String dayName;
  late final String dayOfMonth;

  WeekdayWidget({super.key, required this.date}) {
    isLast = date.weekday == 7;
    dayName = DateFormat('EEEE').format(date);
    dayOfMonth = DateFormat('d').format(date);
  }

  @override
  State<WeekdayWidget> createState() => _WeekdayWidgetState();
}

class _WeekdayWidgetState extends State<WeekdayWidget> {
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
