import 'package:flutter/material.dart';

class WeekHeaderWidget extends StatelessWidget {
  final String title;
  final int weekNumber;

  const WeekHeaderWidget(
      {super.key, required this.title, required this.weekNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.green,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title.toUpperCase(),
                        textScaleFactor: 2,
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
