import 'package:flutter/material.dart';

import 'widgets/ink_well.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My App")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text("MARCH"),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text("Monday"),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text("Tuesday"),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text("Wednesday"),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text("Thursday"),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text("Friday"),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text("Weekend"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
