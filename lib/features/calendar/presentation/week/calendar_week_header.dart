import 'package:flutter/material.dart';
import 'package:planner/utils/date.dart';

class CalendarWeekHeaderWidget extends StatelessWidget {
  final DateTime date;

  late final String title;
  late final int weekNumber;

  CalendarWeekHeaderWidget({super.key, required this.date}) {
    title = getMonthName(date).toUpperCase();
    weekNumber = getWeekOfYear(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              title.toUpperCase(),
              textScaleFactor: 1.5,
            ),
            Text('week $weekNumber'),
          ]),
        ));
  }
}
