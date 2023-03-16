import 'package:flutter/material.dart';
import 'package:planner/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Widget> _screens = <Widget>[CalendarScreen()];

  int _activeNavItemIndex = 0;

  _onNavItemTap(int index) {
    setState(() => _activeNavItemIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Planner")),
      body: _screens.elementAt(_activeNavItemIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeNavItemIndex,
        onTap: _onNavItemTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
        ],
      ),
    );
  }
}
