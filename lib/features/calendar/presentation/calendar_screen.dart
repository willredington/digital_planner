import 'package:flutter/material.dart';

import 'week.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Planner")),
      body: WeekWidget(),
    );
  }
}
