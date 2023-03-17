import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planner/features/calendar/calendar.dart';
import 'package:planner/features/calendar/presentation/day/calendar_day.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

enum Route { calendar, lists, notes }

extension RouteIndex on Route {
  int get index {
    switch (this) {
      case Route.calendar:
        return 0;
      case Route.lists:
        return 1;
      case Route.notes:
        return 2;
    }
  }
}

getRouteIndexForName(String routeName) {
  for (final route in Route.values) {
    if (route.name.startsWith(routeName)) {
      return route.index;
    }
  }

  return 0;
}

getRouteForIndex(int index) {
  for (final route in Route.values) {
    if (route.index == index) {
      return route;
    }
  }

  return Route.calendar;
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/calendar',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return RouteWrapperWidget(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/calendar',
          builder: (BuildContext context, GoRouterState state) {
            return const CalendarScreen();
          },
          routes: [
            GoRoute(
                path: ":date",
                builder: (context, state) =>
                    CalendarDayWidget(dateStr: state.params['date']!))
          ],
        ),
      ],
    ),
  ],
);

class RouteWrapperWidget extends StatefulWidget {
  final Widget child;

  const RouteWrapperWidget({super.key, required this.child});

  @override
  State<RouteWrapperWidget> createState() => _RouteWrapperWidgetState();
}

class _RouteWrapperWidgetState extends State<RouteWrapperWidget> {
  int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    return getRouteIndexForName(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Planner")),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => context.go(getRouteForIndex(index)),
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
