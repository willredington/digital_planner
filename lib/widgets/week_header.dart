import 'package:flutter/material.dart';

class WeekHeaderWidget extends StatelessWidget {
  final String title;
  final int weekNumber;

  const WeekHeaderWidget(
      {super.key, required this.title, required this.weekNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title.toUpperCase(),
                    textScaleFactor: 1.5,
                  ),
                  Text('week $weekNumber'),
                ]),
          ),
          const Divider()
        ],
      ),
    ));
  }
}
